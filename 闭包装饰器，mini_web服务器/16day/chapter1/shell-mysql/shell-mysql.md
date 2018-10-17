# 命令行连接 {#命令行连接}

* 在工作中主要使用命令操作方式，要求熟练编写
* 打开终端，运行命令

```
mysql -uroot -p
回车后输入密码，当前设置的密码为mysql

```

* 连接成功后如下图

![](/Images/assets/2-3-4.png)

* 退出登录

```
quit 和 exit
或
ctrl+d

```

* 登录成功后，输入如下命令查看效果

```
查看版本：select version();
显示当前时间：select now();
```

### 修改输入提示符

```
prompt python>
```

* \D 完整日期
* \U 使用用户



