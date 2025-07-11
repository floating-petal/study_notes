# UV

## 安装
1. 安装用户级别的python
UV 默认使用 python-build-standalone 项目编译的 Python。访问 [python-build-standalone releases](https://link.juejin.cn/?target=https%3A%2F%2Fgithub.com%2Fastral-sh%2Fpython-build-standalone%2Freleases) 页面选择合适的版本。
将该python压缩包解压至`~/local`目录下，再将该python的bin目录配置进用户`.bashrc`中，如此便会优先使用该python
```shell
export PATH=/home/xxx/local/python/bin:$PATH
```
2. 安装uv
`pip install uv`即可，也可下载安装包安装。
3. 创建环境
```
cd project_folder
uv venv --python 3.10
source .venv/bin/activate
```
4. 换源
在项目目录下新建文件`uv.toml`，写入:
```
[[index]]
url = "https://mirrors.tencentyun.com/pypi/simple/"
default = true

trusted-host = ["mirrors.tencentyun.com"]
```

# debugpy
launch.json
```
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [

        {
            "name": "GROOT",
            "type": "debugpy",
            "request": "attach",
            "listen": {
                "host": "localhost",
                "port":12361
            },
           "justMyCode": false
        }
    ]
}
```
代码内加入：
```python
import os
if os.getenv("DEBUGPY", None):
    import debugpy; debugpy.connect(12361)
    print("Debugger is attached, continue running...")
```
# SSH
无密码连接：
`ssh-keygen -t rsa -b 4096 -C "your_email_address"` 生成公钥和密钥
将公钥拷贝至服务器的`~/.ssh/authorized_keys`文件内，再将密钥配置进ssh config：
```
Host [服务器花名]
    HostName 服务器ip地址
    User 用户名称
    IdentityFile ~\.ssh\id_rsa
```

# cuda安装


# Package
在目录下运行`pip install -e .`会根据该目录下的`setup.py`文件配置，将该目录作为package以可编辑的形式安装到环境中。
凡是包含`__ini__.py`文件的目录均为一个package，import该package时，都会运行该目录下的`__init__.py`文件。
