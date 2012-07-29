class RootViewController < UIViewController

	TAG_TOOLBAR = 3
	TAG_WEBVIEW = 2
	TAG_BARBUTTON_ACTION = 31

  def viewDidLoad
 		toolbar = view.viewWithTag(TAG_TOOLBAR)
 		@print_button = toolbar.items.select { |item|
 			item.tag == TAG_BARBUTTON_ACTION
 		}.first
 		@print_button.action = :printPage
 		
 		@webview = view.viewWithTag(TAG_WEBVIEW)
 		url_request = NSURLRequest.requestWithURL NSURL.URLWithString("http://news.google.com")
 		@webview.loadRequest url_request
  end

  def printPage
  	print_interaction_controller = UIPrintInteractionController.sharedPrintController
  	print_interaction_controller.delegate = self
  	print_interaction_controller.showsPageRange = true

  	printInfo = UIPrintInfo.printInfo
  	printInfo.outputType = UIPrintInfoOutputGeneral
  	printInfo.duplex = UIPrintInfoDuplexLongEdge
  	print_interaction_controller.printInfo = printInfo

  	view_formatter = @webview.viewPrintFormatter
  	view_formatter.startPage = 0
  	print_interaction_controller.printFormatter = view_formatter

  	error = Pointer.new(:object)
  	completion_handler = lambda { |controller, completed, error|
  		NSLog("error: #{error}") if !completed && error
  	}

    print_interaction_controller.presentAnimated(true, completionHandler:completion_handler)
  end

end