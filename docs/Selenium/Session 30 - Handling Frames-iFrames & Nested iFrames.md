Initially driver is focused on page level. If you switch its focus to iframe / frame (lets say frame1) then you cannot directly switch its focus to frame2. To do that you need to switch its focus from frame1 to page level i.e. at driver level.

**26:35 --> direct frames**

when we have only one single frame in webpage then only use index cocept i.e. driver.switchTo().frame(index)

Doubts : Why is it like we can't change focus from iframe1 to iframe2 but can change from outerFrame to innerFrame in selenium java ?

NOte that selector hub will not give you iner iframe, it will give you outer iFrame.

Tip : To simplify the locating of the inner iFrame, find the link of the inner iFrame by inspect element and open that link in new tab.

Tip : Whenever you are getting element intercepted exception, element is not clickable exception then try to use javascript executor.