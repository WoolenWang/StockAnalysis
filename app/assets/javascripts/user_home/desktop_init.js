/**
 * Created with JetBrains RubyMine.
 * User: root
 * Date: 10/22/13
 * Time: 5:48 AM
 * To change this template use File | Settings | File Templates.
 */
function init_desktop(lrBarIconData, deskIconData) {
    //存储桌面布局元素的jquery对象
    myLib.desktop.desktopPanel();

//初始化桌面背景
    myLib.desktop.wallpaper.init("/assets/login-bg.jpg");

//初始化任务栏
    myLib.desktop.taskBar.init();

//初始化桌面图标
    myLib.desktop.deskIcon.init(deskIconData);

//初始化桌面导航栏
    myLib.desktop.navBar.init();

//初始化侧边栏
    myLib.desktop.lrBar.init(lrBarIconData);
}