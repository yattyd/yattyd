```
Markdown 文本标记的语法非常简单, 晓风社区目前首选的编辑语法也是这个.
这里给出在 Emacs 中编辑 markdown 文本的简介.
```

准备
===

```
~~~
{.common-lisp}
;; Markdown 模式
; 参考: http://jblevins.org/projects/markdown-mode/
; Debian/Ubuntu 系统安装: emacs-goodies-el 包即可
; 也可以 git clone git://jblevins.org/git/markdown-mode.git
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\\.markdown" . markdown-mode) auto-mode-alist))
~~~
```
准备完有可能需要重启一下(我安装的是 emacs-goodies-el , Ubuntu 11.10
中产生了 /etc/emacs/site-start.d/50emacs-goodies-el.el 启动文件, 手动
运行一下里面的程序就可以了). 打开以 ".markdown" 结尾的文件, 应用
"markdown-mode" 模式.


参考
===

  1. [Emacs Markdown Mode](http://jblevins.org/projects/markdown-mode/)
  2. [Emacs Markdown 模式简介](http://linuxtoy.org/archives/emacs-markdown-mode.html)

