Publisher Events
================

.. note:: The Events API does not require client authentication, but may be
   subject to rate-limiting if called an extreme number of times from the
   same origin.

Submit New Publisher Events
---------------------------

Request
^^^^^^^

::

    POST /api/v1/events/<event_category>/<event_type>/


Available event categories and types
""""""""""""""""""""""""""""""""""""

.. NOTE: To keep the workflow simple, right now we are not requiring custom
   tags to send viewable impression events or interaction events.

.. list-table::
   :widths: 15 25 60
   :header-rows: 1

   * - Event Category
     - Event Type
     - Description

   * - impressions
     - page_impression
     - Marks the beginning of a page session. Fire this event once your page
       has loaded and you have generated your Page Session UUID.

   * - impressions
     - bam_link_impression
     - Signals that a SmartLink (Bam Link) has loaded on the page.


Event request payload
"""""""""""""""""""""

.. list-table::
   :widths: 30 10 60
   :header-rows: 1

   * - Field Name
     - Type
     - Description

   * - organization_type
     - string
     - This field must always be set to ``publisher``.

   * - organization_id
     - integer
     - Your publisher ID.

   * - user
     - object
     - Information about the current visitor to your site, for analytics.

   * - events
     - list[object]
     - Data for each event that you are submitting. You may submit up to 100
       events per API call.


User information fields
"""""""""""""""""""""""

You must generate and assign a :ref:`Page Session UUID <page_session_tutorial>`
to your events. The other fields listed here provide context about your
site visitor and your article for deeper analytics.

.. list-table::
   :widths: 30 10 60
   :header-rows: 1

   * - Field Name
     - Type
     - Description

   * - page_session_uuid
     - string
     - The UUID v4 value that your client has generated for the current
       page session.

   * - source_url
     - string
     - The URL of the current page.

   * - previous_url
     - string
     - Optional. The HTTP Referer URL.

.. NOTE: many fields omitted here to simplify the workflow


Event data for page impressions
"""""""""""""""""""""""""""""""

Page events currently require no additional data. In the ``events`` list,
send an empty object ``{}``.


Event data for SmartLink (Bam Link) impressions
"""""""""""""""""""""""""""""""""""""""""""""""

In the ``events`` list, send an object containing the following data for
each SmartLink:

.. list-table::
   :widths: 30 10 60
   :header-rows: 1

   * - Field Name
     - Type
     - Description

   * - auction_id
     - string
     - The Auction ID of the SmartLink.


Response
^^^^^^^^

Empty response. An HTTP 201 status code indicates successful event submission.


Examples
^^^^^^^^

Submitting a single page impression event::

    POST /api/v1/events/impressions/page_impression/

    {
      "organization_type": "publisher",
      "organization_id": 1,
      "user": {
        "page_session_uuid": "8132ac19-109a-466e-8037-540a9bd12798"
      },
      "events": [
        {}
      ]
    }

::

    HTTP/1.1 201 CREATED
    Content-Length: 0


Submitting a group of two SmartLink impression events using a single request::

    POST /api/v1/events/impressions/bam_link_impression/

    {
      "organization_type": "publisher",
      "organization_id": 1,
      "user": {
        "page_session_uuid": "8132ac19-109a-466e-8037-540a9bd12798"
      },
      "events": [
        {
          "auction_id": "1522995078114976993"
        },
        {
          "auction_id": "1522738266273264784"
        }
      ]
    }

::

    HTTP/1.1 201 CREATED
    Content-Length: 0

