# AutoSub-AHK: 
A GUI skinned version of AutoSub, written with AutoHotkey  
AutoSub的GUI版  

### 项目背景

AutoSub是一款命令行字幕转录工具，目前由[冰灵字幕组](https://github.com/BingLingGroup/AutoSub)开发维护。  
本项目名为AutoSub-AHK，是为了帮助不会用命令行的小伙伴使用AutoSub，用AutoHotkey写的一个图形界面。  

AutoSub-AHK版本v1.0.8由台湾开发者[簡睿]创作，版权归其所有
> Author: Jerry Jian
>  * YouTube: https://www.youtube.com/channel/UC2xBvmv-lhsY4suxv46lplg
>  * Blog: http://jdev.tw/blog

某个字幕组的小伙伴给我介绍了这款软件，让我帮忙做了一些迭代，加入了Auditok控制参数，和讯飞云接口的支持，版本号前进到了v1.1.8
> Iteration: 芦客
> * Bilibili：https://space.bilibili.com/6472728


### Screen snapshot:

![1](https://wx4.sinaimg.cn/mw2000/00262xM9gy1gvlmfy6jdgj60ei0j8diz02.jpg)

### 使用说明

1. 整包解压后点击"autosub-ahk v1.1.8.exe"即可运行  
   如果想要自己hack加入更多功能，请在Windows环境下安装AutoHotkey，对"autosub-ahk源码.ahk" 右键 - 选择"编辑脚本"  
  
2. 支持拖曳添加多个视频文件  
  
3. 输出文件的扩展名为.txt时仅生成纯文本格式，否则默认生成.srt格式  
  
4. 输出文件名会自动加入所选的语言代码  
  
5. 这个软件只是是一个GUI的皮，原理是根据用户输入的参数生成一行AutoSub指令，透过 gen.bat 或 gen-txt.bat 调用AutoSub来执行语音处理：  
    * gen.bat: 用于生成srt字幕  
    * gen-txt.bat: 用于生成纯文本  
  
6. 可自行修改 gen.bat 或 gen-txt.bat 的最后一行命令，添加或变更autosub.exe的执行时的参数  
  
7. 从AutoSub文件夹运行 autosub.exe -h 即会显示可使用的参数  
   autosub.exe -V 可显示当前AutoSub的版本
  
8. 讯飞云接口需要自行配置"xfyun_key.json"，详情请参见[配置文档说明]( https://github.com/BingLingGroup/autosub/blob/dev/docs/README.zh-Hans.md#%E8%AE%AF%E9%A3%9E%E4%BA%91%E8%AF%AD%E9%9F%B3%E8%AF%86%E5%88%AB%E9%85%8D%E7%BD%AE)  
   具体操作就是你去讯飞云的网站申请[语言听写（流式）](https://console.xfyun.cn/services/iat)服务（实名认证后可以白嫖10万次交互额度，够大概20小时的转录量），建立一个自己的app应用，然后把APPID、APISecret和APIKey参数填入到"xfyun_key.json"当中  

9. 目前的讯飞接口仅支持 zh_cn，ja_jp 和 en_us 三种语言，如果需要其他小语种请自行添加下面的片段到源码第257行
比如添加韩语
```
else if (Language = "ko-KR") {
        xfkey := RegExReplace(JSONtext, "mU)language"":\s"".*""`," , "language"": ""ko_kr"",")
      }
```
  
10. GUI界面支持修改的Auditok参数分别是  
    MAX_SUB :       -mxrs = "最长字幕（秒，默认10）"  
    MIN_SUB :       -mnrs = "最短字幕（秒，默认0.5）"  
    ENERGY_THRESH :   -et = "音量阈值（0-100，默认50）"  
    MAX_SILENCE :   -mxcs = "最长沉默间隔（s）"  
  
   默认在gen.bat中添加了  
    NO_STRICT_MIN_SUB :    -nsml, --not-strict-min-length  
   即不严格按照最短字幕长度，程序会自己做一些权衡，这样断句效果更合理  
   更多参数问题：[Auditok文档（纯英文）](https://auditok.readthedocs.io/en/master/command_line_usage.html)  
  
11. 版本自带的AutoSub是目前最新的0.5.7-Alpha版，如果冰灵字幕组推出更新版，自行替换AutoSub子目录进行升级（如果命令行调用方式没有变的话）  

### 其他说明
* 有问题或建议请建[Issue](https://github.com/TrollFeed/autosub-ahk/issues)
* 本人比较懒，提bug不保证及时修，不接新功能提案（比如加入百度云、AWS支持之类的），请不要私信我_(:з」∠)_ （这个也不是大号）
* 推荐动手能力强的同学自己Hack想要的功能，AHK是个很简单的脚本语言（我是为了写这个现学的），这一版的源码里面我也留下了大量的备注。  

* [PyTranscriber](https://github.com/raryelcostasouza/pyTranscriber/)，另外一款底层是AutoSub的GUI套皮软件，貌似最近也开始更新了？  

* OG原版AutoSub-AHK下载：[release](https://github.com/emisjerry/autosub-ahk/releases)，再次感谢[簡睿]大佬造福字幕组  

### How to add languages
* Change the LANGUAGES variable in autoSub-ahk.ahk, add additional language code and description to the autosub.ini file.
  1. Find your language code: 'autoSub\\autoSub.exe -lsc'
  2. Paste the code after LANGUAGE variable that starts with a pipe sign (|)

