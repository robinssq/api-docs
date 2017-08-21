Narrativ Advertiser Tag
====================================

Functionality
------------

The Narrativ advertiser tag allows Narrativ to track user behavior on an advertiser's site. By looking at their
pageviews and purchase behavior, our AI can better optimize the behavior of our auction system and report on its
effect. Any PII that is captured such as names, email addresses, or anything of the sort will be hashed and never
stored in plain text. The tag runs asynchronously in the background to avoid impacting page load times.

Implementation
------------

Our system currently tracks two types of events- page views and checkouts. The checkout tag should be loaded on a
"Thank you for your order" type page- after they have finished checking out and paying. The page view tag should be
loaded on every other page- allowing us to track the user's journey to checkout as well as what products they are
looking at. The Javascript snippet should be placed before the closing </head> tag in your HTML.
In all snippets below the string "ADVERTISER NAME" should be replaced with your Narrativ account name- please ask your
representative if you do not know what that is.

Checkout Tag
------------


For checkout events, you have to fill in some information about the checkout before loading our Javascript. This is
done by inserting the relevant data into a variable called window.BAMX_EVENT_DATA. If a field is optional, you can
just leave it out if you choose not to include the data.

window.BAMX_EVENT_DATA

.. list-table::
   :widths: 30 10 60
   :header-rows: 1

   * - Field Name
     - Type
     - Description

   * - user_email
     - string
     - The user's email address (this will be hashed before being stored - Narrativ does not store PII)

   * - page_type
     - string
     - Required. Must be "checkout" to tell the tag to fire a checkout event.

   * - user_id
     - string
     - Optional. The ID the user has in your system, if available.

   * - order_id
     - string
     - Required. The unique order_id for the checkout that just completed.

   * - order_value
     - float
     - Required. The total purchase price of the order.

   * - currency
     - string
     - Required. The three digit code for the currency that order_value is in (ex: 'USD'). Uses `ISO 4217`_

   * - products_purchased
     - array
     - Required. An array of Product objects representing the purchased items, as defined below.

Product

.. list-table::
   :widths: 30 10 60
   :header-rows: 1

   * - Field Name
     - Type
     - Description

   * - product_id
     - string
     - Required. The unique identifier for this product.

   * - product_name
     - string
     - Required. The name of the product.

   * - product_category
     - string
     - Optional. The `Google category`_ of the product.

   * - product_price
     - float
     - Required. The price of the product

   * - product_quantity
     - integer
     - Required. The number of this product purchased in this order.

Full Example (remember, replace ACCOUNT NAME with your account name)
Also - this is just an example, you can't copy and paste it as is. You need to insert
the checkout data from your page into our data layer using javascript before loading
the Narrativ tag.
::

    <!-- begin NARRATIV jstag -->
    <script type="text/javascript">
        var products = [
            {
                product_id: 'A101',
                product_name: 'Widget 1',
                product_category: 'Electronics > Audio > Audio Accessories > MP3 Player Accessories',
                product_price: 42.00,
                product_quantity: 5
            }, {
                product_id: 'A104',
                product_name: 'Widget 2',
                product_category: 'Electronics > Audio > Audio Accessories > MP3 Player Accessories',
                product_price: 3.50,
                product_quantity: 1
            }
        ]
        window.BAMX_EVENT_DATA = {
            page_type: 'checkout',
            user_id: '1234',
            products_purchased: products,
            order_id: '470',
            order_value: 213.50,
            currency: 'USD',
        };

        (function (account) {
            try {
              var b = document.createElement("script");
              b.type = "text/javascript";
              b.src = "//static.narrativ.com/tags/" + account + ".js";
              b.async = true;
              var a = document.getElementsByTagName("script")[0];
              a.parentNode.insertBefore(b, a);
            } catch (e) {}
        }("ACCOUNT NAME"));
    </script>
    <!-- end NARRATIV jstag -->


Page View Tag
------------

The page view tag goes on every page except the checkout page. Remember to change ADVERTISER NAME to your account name.

window.BAMX_EVENT_DATA

.. list-table::
   :widths: 30 10 60
   :header-rows: 1

   * - Field Name
     - Type
     - Description

   * - user_email
     - string
     - The user's email address (this will be hashed before being stored - Narrativ does not store PII)

   * - user_id
     - string
     - The ID the user has in your system, if available.


::

    <!-- begin NARRATIV jstag -->
    <script type="text/javascript">
        window.BAMX_EVENT_DATA = {
            user_email: 'email@gmail.com',
            user_id: '1234'
        }
        (function (account) {
            try {
                var b = document.createElement("script");
                b.type = "text/javascript";
                b.src = "//static.narrativ.com/tags/" + account + ".js";
                b.async = true;
                var a = document.getElementsByTagName("script")[0];
                a.parentNode.insertBefore(b, a);
            } catch (e) {}
        }("ADVERTISER NAME"));
    </script>
    <!-- end NARRATIV jstag -->

.. _Google category: https://support.google.com/merchants/answer/6324436?hl=en
.. _ISO 4217: https://www.iso.org/iso-4217-currency-codes.html
