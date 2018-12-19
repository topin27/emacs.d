;;; init-keymap --- 初始化键盘绑定相关

;;; Commentary:

;;; Code:

(windmove-default-keybindings)

(require 'general)
(general-create-definer my-leader-def
			:prefix "\\")
(my-leader-def 'normal
	       "f" 'find-file
	       "b" 'ido-switch-buffer
	       "k" 'ido-kill-buffer
	       "r" 'recentf-open-files
	       "p" 'projectile-switch-project
	       "o" 'find-file-other-window
	       "g g" 'xref-find-definitions
	       "g b" 'xref-pop-marker-stack
	       "g c" 'xref-find-references
	       )
(general-create-definer my-local-leader-def
			;; :prefix my-local-leader
			  :prefix ",")
(my-local-leader-def 'normal
		     "f" 'projectile-find-file
		     "b" 'projectile-switch-to-buffer
		     "p" 'projectile-switch-open-project
		     "o" 'projectile-find-file-other-window
		     "k" 'projectile-kill-buffers
		     "j i" 'idomenu
		     )
(general-define-key
 :prefix "C-c"
 "SPC" 'ace-jump-mode
 "p" 'projectile-command-map
 "j i" 'idomenu
 "\\" 'imenu-list-smart-toggle
 "o c" 'org-capture
 "o a" 'org-agenda
 "o l" 'org-store-link
 "C-c M-x" 'execute-extended-command  ;; old M-x
 "y" 'company-yasnippet
 )
(general-define-key
 "M-x" 'smex
 "M-X" 'smex-major-mode-commands
 "M-/" 'hippie-expand
 "C-x C-b" 'ibuffer
 "RET" 'newline-and-indent
 "<f10>" 'rename-buffer
 "<escape>" 'keyboard-escape-quit
 "C-x C-r" 'recentf-open-files
 )

(provide 'init-keymap)

;;; init-keymap ends her
