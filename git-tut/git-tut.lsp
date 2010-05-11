(defun "git config" (config-list)
  (add-to repo config-list))

(defun "git init" ()
  (create-repo))

(defun "git-add" (new-file-list)
  (add-to index new-file-list))

(defun "git commit" ()
  (progn
    (add-to repo index)
    (zap index)))

(defun "git diff --cached" (&optional commit-name || "HEAD")
  (let (
	(file-lists (list (files-in index)
			  (files-in commit-name)))
	)
    (apply diff file-lists)))

(defun "git diff" ()
  (let (
	(file-lists (reverse (list (files-in index)
				   (files-in working-tree))))
	)
    (apply diff file-lists)))

(defun "git status" ()
  (let (
	(modified-file-list (
  