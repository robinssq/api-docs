Narrativ Publisher Tag
====================================

Functionality
------------

The Narrativ publisher tag does two main things. First, it will find any SmartLinks on the page and pre-execute
the auctions, allowing the destination of the links to be updated ahead of time. Second, it will track user behavior
such as SmartLink impressions and clicks.

Implementation
------------

Getting the publisher tag running is pretty simple- just paste the following javascript snippet in the HEAD section of
all of your site's pages. Make sure that you replace "ACCOUNT NAME" with the name of your account in the narrativ
system. You can ask your account manager what that is, or log into dashboard.narrativ.com and go to
`setup`_ to see the snippet customized with your account info.
There is also a checker on that page where you can insert your site url and it will verify that the tag is correctly
installed.

::

    <script type="text/javascript">
        (function(window, document, account) {
            window.skimlinks_exclude = ["shop-links.co", "shop-edits.co"];
            var b = document.createElement("script");
            b.type = "text/javascript";
            b.src = "//static.narrativ.com/tags/" + account + ".js";
            b.async = true;
            var a = document.getElementsByTagName("script")[0];
            a.parentNode.insertBefore(b,a);
        })(window, document, "ACCOUNT NAME");
    </script>


.. _setup: https://dashboard.narrativ.com/#/publisher/account/setup
