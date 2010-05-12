(defun git_init ()
  (setq *repo* (create-repo)))

(defun git_config (config-list)
  (add-to *repo* config-list))

(defun git_add (new-file-list)
  (add-to *index* new-file-list))

(defun git_commit ()
  (progn
    (add-to *repo* *index*)
    (zap *index*)))

(defun git_commit_-a ()
  (progn
    (add-to *index* (modified-files-in *working-tree*))
    (git_commit)))

(defun git_diff_--cached (&optional commit-name || "HEAD")
  (let (
	(file-lists (list (files-in *index*)
			  (files-in commit-name)))
	)
    (apply diff file-lists)))

(defun git_diff ()
  (let (
	(file-lists (list (files-in working-tree)
			  (files-in *index*)))
	)
    (apply diff file-lists)))

(defun git_log ()
  (display (history-of-changes)))

(defun git_log_-p ()
  (display (diffs-of (history-of-changes))))

(defun git_log_--stat_--summary ()
  (foreach change (history-of-changes)
	   (progn
	     (display (diffs-of change))
	     (display (note-on change)))))

(defun git_branch (branch-name)
  (cons-to-property 'branch *repo* branch-name))

(defun git_checkout (branch-name)
  (setq *current-branch* branch-name))

(defun git_merge (branch-name)
  (let (
	(branch-changes (get-changes-on branch-name))
	)
    (integrate branch-changes *current-branch*)))

(defun git_branch_-d (branch-name)
  (and
   (fully-merged branch-name *current-branch*)
   (rm_-rf branch-name)))

(defun git_branch_-D (branch-name)
   (fully-merged branch-name *current-branch*))

(defun git_clone (repo-url (&optional local-name || (filename-of repo-url)))
  (mkdir local-name)
  (copy-files-and-history repo-url local-name))

(defun git_pull (repo-url (&optional repo-branch || "master"))
  (integrate *current-branch* (changes-from repo-url repo-branch)))
  

(defun git_status ()
  (let (
	(modified-file-list (
  