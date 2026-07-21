#include "big_brother.h"
#include "fat_volume.h"
#include "fat_table.h"
#include "fat_util.h"
#include <stdio.h>
#include <string.h>

// search_bb_orphan_dir_cluster looks through the first MAX_CLUSTER_SEARCH
// clusters
#define MAX_CLUSTER_SEARCH 10000

static bool check_fslog(u8 *buffer, fat_dir_entry end_ptr) {
    fat_dir_entry disk_dentry_ptr = NULL;
    for (disk_dentry_ptr = (fat_dir_entry)buffer; disk_dentry_ptr <= end_ptr; disk_dentry_ptr++) {
		DEBUG("Reading /%s.%s/""\n",disk_dentry_ptr->base_name,disk_dentry_ptr->extension);
		if (bb_is_log_file_dentry(disk_dentry_ptr)) 
            return true;
    }
	return false;
}

int bb_is_log_file_dentry(fat_dir_entry dir_entry) {
    return strncmp(LOG_FILE_BASENAME, (char *)(dir_entry->base_name), 3) == 0 &&
           strncmp(LOG_FILE_EXTENSION, (char *)(dir_entry->extension), 3) == 0;
}

int bb_is_log_filepath(char *filepath) {
    return strncmp(BB_LOG_FILE, filepath, 8) == 0;
}

int bb_is_log_dirpath(char *filepath) {
    return strncmp(BB_DIRNAME, filepath, 15) == 0;
}

static u32 bb_create_new_orphan_dir() {
  u32 bb_dir_start_cluster;
  fat_volume vol = NULL;
  vol = get_fat_volume();

  // searches for a free cluster and marks it as a bad sector
  bb_dir_start_cluster = fat_table_get_next_free_cluster(vol->table);
  fat_table_set_next_cluster(vol->table, bb_dir_start_cluster,
                             FAT_CLUSTER_BAD_SECTOR);

  return bb_dir_start_cluster;
}

/* Searches for a cluster that could correspond to the bb directory and returns
 * its index. If the cluster is not found, returns 0.
 */
u32 search_bb_orphan_dir_cluster() {
  u32 bb_dir_start_cluster = 0, bytes_per_cluster = 0;
  // starts looking for a free cluster starting from cluster 2, because 0 and 1
  // are reserved
  u32 current_cluster = 2;
  off_t current_offset = 0;
  fat_volume vol = NULL;
  u8 *buf = NULL;
  bool found = false;

  vol = get_fat_volume();
  bytes_per_cluster = fat_table_bytes_per_cluster(vol->table);
  buf = alloca(bytes_per_cluster);
  fat_dir_entry end_ptr = (fat_dir_entry)(buf + bytes_per_cluster) - 1;

  // search for a cluster marked as a bad sector and which has an entry called
  // fs.log in the 0th position
  while (fat_table_is_valid_cluster_number(vol->table, current_cluster) &&
         current_cluster <= MAX_CLUSTER_SEARCH && !found) {
    if (fat_table_cluster_is_bad_sector(
            ((le32 *)vol->table->fat_map)[current_cluster])) {
      DEBUG("Found reserved: %d\n", current_cluster);
      current_offset = fat_table_cluster_offset(vol->table, current_cluster);
      if (full_pread(vol->table->fd, buf, bytes_per_cluster, current_offset) !=
          bytes_per_cluster) {
        return 0;
      }
      found = check_fslog(buf, end_ptr);
      if (found) {
        bb_dir_start_cluster = current_cluster;
      }
    }
    current_cluster++;
  }

    return bb_dir_start_cluster;
}

/* Creates the /bb directory as an orphan and adds it to the file tree as
 * child of root dir. */
int bb_init_log_dir() {
    errno = 0;
    u32 bb_dir_cluster = 0;
    fat_volume vol = NULL;
    fat_file loaded_bb_dir = NULL;
    fat_tree_node root_node = NULL;

    vol = get_fat_volume();

	bb_dir_cluster = search_bb_orphan_dir_cluster();
        DEBUG("Cluster found at: %d", bb_dir_cluster);

        // 	create the bb directory on disk if it's not done already
	if (bb_dir_cluster == 0) {
		bb_dir_cluster = bb_create_new_orphan_dir();
		DEBUG("Big brother not found, creating at: %d",bb_dir_cluster);
        }

        // Create a new file from scratch, instead of using a direntry like
        // normally done.
        loaded_bb_dir =
            fat_file_init_orphan_dir(BB_DIRNAME, vol->table, bb_dir_cluster);

        // Add directory to file tree under root. It's entries will be like any
        // other dir.
        root_node = fat_tree_node_search(vol->file_tree, "/");
        vol->file_tree =
            fat_tree_insert(vol->file_tree, root_node, loaded_bb_dir);

        return -errno;
}
