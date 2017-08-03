Sending and Receiving Data
==========================

Data formats
------------

The API is accessed via HTTPS at https://api.narrativ.com/ . Use JSON when
sending data to API endpoints that require it. Remember to specify
``Content-Type: application/json`` in the request headers.

When sending URLs, make sure to use the complete link, including the
``http://`` or ``https://`` part.

Timestamps are formatted according to the ISO 8601 standard, using the
UTC time zone, and are precise to the nearest second. For example,
``2017-07-26T19:48:25Z``.


Response fields
---------------

API responses will always contain a few standard fields:

* info: An object containing general information about the request/response:

  * error: ``true`` if something went wrong with the API request, or ``false``
    if everything is okay.
  * status: The HTTP status code, repeated here for convenience.

* data: A list of resources returned by the request.

* error: If an error occurred, this object will contain detailed information
  about the problem.

  * code: A number categorizing the error.
  * message: A string describing the specific error.
