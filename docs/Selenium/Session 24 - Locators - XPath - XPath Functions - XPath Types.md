Absolute X path contains only tag name. it follows hierarchy structure.

you can find X-paths using two methods : by using inspect element and by using Selector Hub (chrome extension)

open inspect element, take mouse to the element whom you want to copy, right click on it, go to copy -> "Copy Full XPath" (Absolute XPath)

"Copy XPath" (Relative XPath)

What are attributes in HTML / Automation Testing / Selenium ?

**Note:** if u r using SelectorHub then use "Rel XPath" which has syntax "//tag\[@attribute='<attribute\_value>'\]

eg. //input\[@placeholder='Search'\]

---

There are two types of xpath

1.  xpath with single attributes
    
2.  xpath with multiple attributes
    

**Difference:** xpath with attribute vs xpath without attribute

## xPath with inner Text

**Difference:** tag vs attribute

link text an be inner text but all inner text cannot be link text

**Note:** we can use \* (star) instead of tag-name

**Difference:** .contains() vs .starts-with()

Q. How you will able to handle dynamic elements using X-paths ?

## Chained xPath

If attributes of element is not available then we can take attributes of parent element and write x path. from there we can navigate to the chain element.