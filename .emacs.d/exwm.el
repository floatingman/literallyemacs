(use-package exwm
  :init
  (setq mouse-autoselect-window nil
        focus-follows-mouse t
        exwm-workspace-warp-cursor t
        exwm-workspace-number 5)
        ;exwm-workspace-display-echo-area-timeout 5
        ;exwm-workspace-minibuffer-position 'bottom) ;; Annoying focus issues
  :config
  ;; Make class name the buffer name
  (add-hook 'exwm-update-class-hook
            (lambda ()
              (exwm-workspace-rename-buffer exwm-class-name)))
  (add-hook 'exwm-update-title-hook
            (lambda ()
              (pcase exwm-class-name
                ("Vimb" (exwm-workspace-rename-buffer (format "vimb: %s" exwm-title)))
                ("qutebrowser" (exwm-workspace-rename-buffer (format "Qutebrowser: %s" exwm-title))))))

  (exwm-enable))

;; Enable exwm-randr before exwm-init gets called
(use-package exwm-randr
  :if dw/exwm-enabled
  :after (exwm)
  :config
  (exwm-randr-enable)
  (setq exwm-randr-workspace-monitor-plist '(4 "eDP-1")))
