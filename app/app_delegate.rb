class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    UIApplication.sharedApplication.setStatusBarHidden true
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    storyboard = UIStoryboard.storyboardWithName("Storyboard", bundle:nil)
    rootViewController = storyboard.instantiateViewControllerWithIdentifier("RootViewController")
    @window.rootViewController = rootViewController
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
    true 
  end
end
