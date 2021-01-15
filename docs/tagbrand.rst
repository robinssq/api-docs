Narrativ Brand Tag
==================

What is it?
-----------

The Narrativ Brand Tag is a lightweight javascript tag that enables partners to maximize their performance
and unlock valuable article and product level insights in a customized dashboard.
Only clients with Narrativ’s Brand Tag can optimize their campaigns by ROAS and see more comprehensive
metrics like revenue and RPC.

Please note: data collection by the brand tag does not contain personally identifiable information (PII)
and is in compliance with GDPR and CCPA.


How it Works
------------

The Narrativ Brand Tag is responsible for handling two types of events: page impressions and checkouts.

Page Impressions
^^^^^^^^^^^^^^^^

Page impression events enable Narrativ to ensure attribution for our partners.
These events should be fired on every page that doesn’t contain PII.

**Please note:** This data collection does not contain PII and is in compliance with GDPR and CCPA.

Checkouts
^^^^^^^^^

Checkout events allow Narrativ to accurately capture revenue and conversions in real time.
The data gathered by checkout events also powers an experience publishers rely on to track
top sellers and give better product recommendations on their articles.

Checkout events should be fired on your site’s **Order Confirmation Page**, or the page that loads
immediately **after** they’ve *successfully* purchased their items.

**Please note:** Similar to Page Impression, Checkouts are in compliance with GDPR and CCPA
and does not capture personally identifiable information (PII). Additionally, since the tag
runs asynchronously in the background, there is no impact to the page load time.


Implementation
--------------

Page Impression Events
^^^^^^^^^^^^^^^^^^^^^^
Getting the Narrativ Brand Tag to fire page impression events is a simple process.
Copy and paste the following Javascript snippet in the HEAD section of all your
site’s pages *that don’t contain PII*.

* Make sure to replace ``ACCOUNT NAME`` with your Narrativ account name.

* Need your Narrativ account name? Reach out to your growth manager or support@narrativ.com for assistance.

::

  <script type="text/javascript">
      (function(account) {
          try {
              var b = document.createElement("script");
              b.type = "text/javascript";
              b.src = "https://static.narrativ.com/tags/" + account + ".js";
              b.async = true;
              var a = document.getElementsByTagName("script")[0];
              a.parentNode.insertBefore(b, a);
          } catch (e) {}
      }("ACCOUNT NAME"));
  </script>

Checkout Events
^^^^^^^^^^^^^^^

In order to successfully fire checkout events with the Narrativ Brand Tag, the following code snippet
must be populated with information about the checkout, along with a few details about each of
the products purchased. This snippet should be placed on your site’s **Order Confirmation Page**,
or the page displayed to customers immediately after they’ve *successfully* purchased their items.

Make the Checkout Event Code Work for You
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Follow the sample code below, making these changes:

.. list-table::
   :widths: 40 60
   :header-rows: 1

   * - Statement
     - Requirement

   * - ``var purchased = <dataLayerProducts>;``
     - Replace ``<dataLayerProducts>`` with the list of purchased products in your data layer.
       Each item in this list represents attributes of a single purchased product (explained in the following items).

   * - ``product_id: purchased[i].<ItemID>,``
     - Replace ``<ItemID>`` with the variable name your data layer uses to define item ID, or the unique identifier
       for the purchased product. This can likely be found in the ``dataLayerProducts`` list described above.

   * - ``product_name: purchased[i].<ItemName>,``
     - Replace ``<ItemName>`` with the variable name your data layer uses to define item name, or the name
       for the purchased product. This can likely be found in the ``dataLayerProducts`` list described above.

   * - ``product_price: purchased[i].<ItemPrice>,``
     - Replace ``<ItemPrice>`` with the variable name your data layer uses to define item price, or the *per-unit price*
       of the purchased product. This can likely be found in the ``dataLayerProducts`` list described above.

   * - ``product_quantity: purchased[i].<ItemQuantity>,``
     - Replace ``<ItemQuantity>`` with the variable name your data layer uses to define item quantity, or the quantity
       of the purchased product. This can likely be found in the ``dataLayerProducts`` list described above.

   * - ``product_brand: purchased[i].<ItemBrand>,``
     - Replace ``<ItemBrand>`` with the variable name your data layer uses to define item brand, or the brand
       of the purchased product. This can likely be found in the ``dataLayerProducts`` list described above.

       Note: If Item Brand is not available, replace ``<ItemBrand>`` with ``null``

   * - ``product_size: purchased[i].<ItemSize>,``
     - Replace ``<ItemSize>`` with the variable name your data layer uses to define item size, or the size
       of the purchased product. This can likely be found in the ``dataLayerProducts`` list described above.

       Note: If Item Size is not available, replace ``<ItemSize>`` with ``null``

   * - ``product_color: purchased[i].<ItemColor>,``
     - Replace ``<ItemColor>`` with the variable name your data layer uses to define item color, or the color
       of the purchased product. This can likely be found in the ``dataLayerProducts`` list described above.

       Note: If Item Color is not available, replace ``<ItemColor>`` with ``null``

   * - ``orderTotal += (purchased[i].<ItemPrice> *``
       ``purchased[i].<ItemQuantity>);``
     - Replace ``<ItemPrice>`` and ``<ItemQuantity>`` with the same respective values used above.

   * - ``is_new_visitor: <IsNewVisitor>,``
     - Replace ``<IsNewVisitor>`` with a boolean (true/false) indicating if the customer is new to your site.

       Note: If this is not available, replace ``<IsNewVisitor>`` with ``null``

   * - ``order_id: <OrderID>,``
     - Replace ``<OrderID>`` with the order ID, a unique identifier for the order.

   * - ``currency: <CurrencyCode>,``
     - Replace ``<CurrencyCode>`` with the three digit currency code that order was placed in (ex: ‘USD’). Uses `ISO 4217`_

**Note:** Remember to also replace ``ACCOUNT NAME`` with your Narrativ account name.

::

    <script type="text/javascript">
        var purchased = <dataLayerProducts>;
        var productsPurchased = [];
        var orderTotal = 0;
        for (var i = 0; i < purchased.length; i++) {
          productsPurchased.push({
            product_id: purchased[i].<ItemID>,
            product_name: purchased[i].<ItemName>,
            product_brand: purchased[i].<ItemBrand>,
            product_size: purchased[i].<ItemSize>,
            product_color: purchased[i].<ItemColor>,
            product_price: purchased[i].<ItemPrice>,
            product_quantity: purchased[i].<ItemQuantity>,
          });
          orderTotal += (purchased[i].<ItemPrice> * purchased[i].<ItemQuantity>);
        }

        window.BAMX_EVENT_DATA = {
            page_type: 'checkout',
            is_new_visitor: <IsNewVisitor>,
            products_purchased: productsPurchased,
            order_id: <OrderID>,
            order_value: orderTotal,
            currency: <CurrencyCode>,
        };

        (function(account) {
            try {
              var b = document.createElement("script");
              b.type = "text/javascript";
              b.src = "https://static.narrativ.com/tags/" + account + ".js";
              b.async = true;
              var a = document.getElementsByTagName("script")[0];
              a.parentNode.insertBefore(b, a);
            } catch (e) {}
        }("ACCOUNT NAME"));
    </script>


Google Tag Manager Walkthrough
------------------------------

Implementing the Narrativ Brand Tag with Google Tag Manager is a simple process. Follow the instructions below
to implement the tag using a "Custom HTML" tag in GTM.

Start by navigating to your Google Tag Manager Dashboard.

- Select the "Tags" menu item from the menu on the left-hand side of the page.
- Once on the "Tags" page, select the "New" button to create a new tag.
- Select the "Tag Configuration" box to begin making a new tag.

.. image:: _static/pixel_implementation_screenshots/1_tap_configuration.png

- Select the "Custom HTML" option to open an empty text field.

.. image:: _static/pixel_implementation_screenshots/2_choose_custom_html.png

- Copy and paste the code outlined in the above section entitled “Page Impression Events: Implementation”.
  Make sure you replace ``ACCOUNT NAME`` with your Narrativ account name.

.. image:: _static/pixel_implementation_screenshots/3_enter_tag_html.png

- Select "All Pages" as the correct trigger for these events.

.. image:: _static/pixel_implementation_screenshots/4_select_trigger.png

- Name the tag "Narrativ Page Impression Events" and double check that the trigger is set to "All Pages".

.. image:: _static/pixel_implementation_screenshots/5_final_product.png

- For checkout events, create a new tag and open the empty text field again.

.. image:: _static/pixel_implementation_screenshots/checkout_1_open_editor.png

- Follow the instructions outlined in the “Checkout Events: Implementation” Section above to successfully fire checkout events.

.. image:: _static/pixel_implementation_screenshots/checkout_2_confirm_code_product_info.png

- Select the box under "Triggering" to add a trigger for this tag.

.. image:: _static/pixel_implementation_screenshots/checkout_3_add_trigger.png

- If you don’t already have a trigger for checkout pages, then it’s easy to create one!

.. image:: _static/pixel_implementation_screenshots/checkout_4_add_confirmation_page_trigger.png

- The below example has a series of triggers based off of common URL types for checkout or confirmation pages. (E.g. narrativ.com/checkout/ will trigger the "Checkout Page" option). Replace "checkout" with whatever word your site uses on checkout pages. Remember, you only need one trigger!

.. image:: _static/pixel_implementation_screenshots/checkout_4.1_add_confirmation_rules.png

- Double check the tag name, make sure you’ve updated the code with the information on your checkout page, and make sure you’ve selected the correct trigger.

.. image:: _static/pixel_implementation_screenshots/checkout_5_double_check.png

- Make sure that the tag(s) are showing up in the "Tag" tab.

.. image:: _static/pixel_implementation_screenshots/submit_1_tag_confirmation.png

- Preview the changes made and fix any errors that pop up in the window.

.. image:: _static/pixel_implementation_screenshots/submit_2_review.png

- Click the "Submit" button to save your changes (this step is not final)

.. image:: _static/pixel_implementation_screenshots/submit_3_submit_changes.png

- Double check that everything you modified is in this submission. Name the submission something like "Adding Narrativ Brand Tag" so that it’s easy to find if you need to go back and debug any issues in the future.

.. image:: _static/pixel_implementation_screenshots/submit_4_title_the_changes.png


If you have any issues during this process then reach out to your Narrativ growth manager or email us at support@narrativ.com.

.. _Google category: https://support.google.com/merchants/answer/6324436?hl=en
.. _ISO 4217: https://www.iso.org/iso-4217-currency-codes.html
