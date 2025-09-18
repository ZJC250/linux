![markdown](https://markdown.com.cn/hero.png "markdown")

# Markdown 线上教程 

**Markdown是一种轻量级的「标记语言」**

Markdown是一种可以使用普通文本编辑器编写的标记语言，通过简单的标记语法，它可以使普通文本内容具有一定的格式。它允许人们使用易读易写的纯文本格式编写文档，然后转换成格式丰富的HTML页面，Markdown文件的后缀名便是“.md”


## 1. 查看Markdown文件

### 1.1. 使用文本编辑器查看
Markdown文件本身是一个普通的文本文件，可以使用任何文本编辑器打开，但是打开后看到的是带Markdown语法标记的文本，不是HTML富文本格式。使用文本编辑器打开时**一般用于文本编辑**，如果仅仅是查看，则推荐使用浏览器。

### 1.2. 使用浏览器查看
浏览器本身只能显示原始的Markdown文本（即带语法标记的原始格式），但**Edge**, **Firefox**等现代浏览器安装*Markdown Viewer*插件后，可以显示富文本格式的文件内容。

**特别说明**：如果Markdown文件已经在SCM（比如，git, svn等）的仓库中，使用浏览器打开`*.md`文件时，
无需插件也可以将Markdown文本自动显示为富文本格式的网页形式。

下面以Mircosoft Edge浏览器为例，说明插件的安装与使用：
> 插件安装： `扩展` -> `管理扩展` -> `获取Mircosoft Edge扩展` -> `输入 "Markdown Viewer"` -> `安装`

> 扩展设置： `扩展` -> `已安装的扩展` -> `Markdown Viewer` -> `详细信息` -> `扩展选项` -> `ALLOW ALL`


如果在浏览器中想要查看原始的Markdown文本，只需要在对应的网页上点击 `右键` -> `查看页面源码`。

### 1.3. 使用VsCode插件查看
使用VsCode编辑Markdown文本时，可以通过插件实时显示Markdown文本的富文本效果，详情参见`shd101wyy.markdown-preview-enhanced`插件。


## 2. MdEditor的功能列表演示
**特别说明**：点击 `右键` -> `查看页面源码` 即可查看对应显示效果的原始Markdown语法。

### 2.1. 标题

# 标题H1

## 标题H2

### 标题H3

#### 标题H4

##### 标题H5

###### 标题H5

### 2.2. 字符效果和横线等

----

~~删除线~~ <s>删除线（开启识别HTML标签时）</s>
*斜体字*      _斜体字_
**粗体**  __粗体__
***粗斜体*** ___粗斜体___

上标：X<sub>2</sub>，下标：O<sup>2</sup>

**缩写(同HTML的abbr标签)**

> 即更长的单词或短语的缩写形式，前提是开启识别HTML标签时，已默认开启

The <abbr title="Hyper Text Markup Language">HTML</abbr> specification is maintained by the <abbr title="World Wide Web Consortium">W3C</abbr>.

### 2.3. 引用 Blockquotes

> 引用文本 Blockquotes

引用的行内混合 Blockquotes
                    
> 引用：如果想要插入空白换行`即<br />标签`，在插入处先键入两个以上的空格然后回车即可，[普通链接](http://localhost/)。

### 2.4. 锚点与链接 Links

[普通链接](http://localhost/)

[普通链接带标题](http://localhost/ "普通链接带标题")

直接链接：<https://github.com>

[锚点链接][anchor-id] 

[anchor-id]: http://www.this-anchor-link.com/

GFM a-tail link @pandao

> @pandao

### 2.5. HTML图片引用 HTML Image
<div align=center><img src=../image/vscode-architecture-ssh.png width="60%"></div>


### 2.6. 多语言代码高亮 Codes

#### 2.6.1 行内代码 Inline code

执行命令：`npm install marked`

#### 2.6.2. 缩进风格

即缩进四个空格，也做为实现类似`<pre>`预格式化文本(Preformatted Text)的功能。

    <?php
        echo "Hello world!";
    ?>

预格式化文本：

    | First Header  | Second Header |
    | ------------- | ------------- |
    | Content Cell  | Content Cell  |
    | Content Cell  | Content Cell  |

#### 2.6.3. JS代码　

```javascript
function test(){
	console.log("Hello world!");
}
 
(function(){
    var box = function(){
        return box.fn.init();
    };

    box.prototype = box.fn = {
        init : function(){
            console.log('box.init()');

			return this;
        },

		add : function(str){
			alert("add", str);

			return this;
		},

		remove : function(str){
			alert("remove", str);

			return this;
		}
    };
    
    box.fn.init.prototype = box.fn;
    
    window.box =box;
})();

var testBox = box();
testBox.add("jQuery").remove("jQuery");
```

#### 2.6.4. HTML代码 HTML codes

```html
<!DOCTYPE html>
<html>
    <head>
        <mate charest="utf-8" />
        <title>Hello world!</title>
    </head>
    <body>
        <h1>Hello world!</h1>
    </body>
</html>
```

### 2.7. 图片 Images

Image:

![](https://markdown.com.cn/assets/img/process.625bbd35.png)

> 图为：Markdown 文档的处理过程

图片加链接 (Image + Link)：

[![](https://markdown.com.cn/assets/img/notepad.3541bd12.png)](https://markdown.com.cn/intro.html "Markdown介绍")

> 图为：Markdown演示文档

----

### 2.8. 列表 Lists

#### 2.8.1. 无序列表（减号）Unordered Lists (-)

- 列表一
- 列表二
- 列表三
  
#### 2.8.2. 无序列表（星号）Unordered Lists (*)

* 列表一
* 列表二
* 列表三

#### 2.8.3. 无序列表（加号和嵌套）Unordered Lists (+)

+ 列表一
+ 列表二
    + 列表二-1
    + 列表二-2
    + 列表二-3
+ 列表三
    * 列表一
    * 列表二
    * 列表三

#### 2.8.4. 有序列表 Ordered Lists (-)

1. 第一行
2. 第二行
3. 第三行

#### 2.8.5. GFM task list

- [x] GFM task list 1
- [x] GFM task list 2
- [ ] GFM task list 3
    - [ ] GFM task list 3-1
    - [ ] GFM task list 3-2
    - [ ] GFM task list 3-3
- [ ] GFM task list 4
    - [ ] GFM task list 4-1
    - [ ] GFM task list 4-2
                
----

### 2.9. 绘制表格 Tables

| 项目        | 价格   |  数量  |
| --------   | -----:  | :----:  |
| 计算机      | $1600   |   5     |
| 手机        |   $12   |   12   |
| 管线        |    $1    |  234  |

First Header  | Second Header
------------- | -------------
Content Cell  | Content Cell
Content Cell  | Content Cell 

| First Header  | Second Header |
| ------------- | ------------- |
| Content Cell  | Content Cell  |
| Content Cell  | Content Cell  |

| Function name | Description                    |
| ------------- | ------------------------------ |
| `help()`      | Display the help window.       |
| `destroy()`   | **Destroy your computer!**     |

| Left-Aligned  | Center Aligned  | Right Aligned |
| :------------ |:---------------:| -----:|
| col 3 is      | some wordy text | $1600 |
| col 2 is      | centered        |   $12 |
| zebra stripes | are neat        |    $1 |

| Item      | Value |
| --------- | -----:|
| Computer  | $1600 |
| Phone     |   $12 |
| Pipe      |    $1 |

----

### 2.10. 特殊符号 HTML Entities Codes

&copy; &  &uml; &trade; &iexcl; &pound;
&amp; &lt; &gt; &yen; &euro; &reg; &plusmn; &para; &sect; &brvbar; &macr; &laquo; &middot; 

X&sup2; Y&sup3; &frac34; &frac14;  &times;  &divide;   &raquo;

18&ordm;C  &quot;  &apos;

#### 2.10.1 Emoji表情 :smiley:

> Blockquotes :star:

#### 2.10.2. GFM task lists & Emoji & fontAwesome icon emoji & editormd logo emoji :editormd-logo-5x:

- [x] :smiley: @mentions, :smiley: #refs, [links](), **formatting**, and <del>tags</del> supported :editormd-logo:;
- [x] list syntax required (any unordered or ordered list supported) :editormd-logo-3x:;
- [x] [ ] :smiley: this is a complete item :smiley:;
- [ ] []this is an incomplete item [test link](#) :fa-star: @pandao; 
- [ ] [ ]this is an incomplete item :fa-star: :fa-gear:;
    - [ ] :smiley: this is an incomplete item [test link](#) :fa-star: :fa-gear:;
    - [ ] :smiley: this is  :fa-star: :fa-gear: an incomplete item [test link](#);

#### 2.10.3. 反斜杠 Escape

\*literal asterisks\*
            

### End
