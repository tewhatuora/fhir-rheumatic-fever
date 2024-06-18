// REST resource CRUD operations
RuleSet: GenericCRUDInteractions
* interaction[0].code = #create
* interaction[+].code = #read
* interaction[+].code = #update
* interaction[+].code = #delete
* interaction[+].code = #vread
* interaction[+].code = #search-type
* versioning = #versioned
* readHistory = false
* updateCreate = false
* conditionalCreate = false
* conditionalRead = #not-supported
* conditionalUpdate = false
* conditionalDelete = #not-supported

// defines operations supported for canonical definitions (owned by HNZ)
RuleSet: DefinitionalResourceInteractions
* interaction[+].code = #read
* interaction[+].code = #vread
* interaction[+].code = #search-type
* versioning = #versioned
* readHistory = false
* updateCreate = false
* conditionalCreate = false
* conditionalRead = #not-supported
* conditionalUpdate = false
* conditionalDelete = #not-supported

// REST resource search only interfaces (no CRUD)
RuleSet: SearchOnlyInteraction
* interaction[+].code = #search-type
* versioning = #versioned
* readHistory = false
* updateCreate = false
* conditionalCreate = false
* conditionalRead = #not-supported
* conditionalUpdate = false
* conditionalDelete = #not-supported

// adds markdown doc to a CapabilityStatement element
RuleSet: ResourceDocumentation(markdown)
* documentation = "{markdown}"

// documents errors per HNZ standard (https://apistandards.digital.health.nz/api-development/Synchronous%20APIs/Error%20Handling)
RuleSet: StandardErrorsDocumentation
* documentation = """
  ### Read (GET) Operation Statuses

  |**Code**|**Meaning**|**Description**|
  |:--:|:-----------------|:--|
  |200|OK                 |The request was successful, and the response body contains the representation requested|
  |302|FOUND              |A common redirect response; you can GET the representation at the URI in the Location response header|
  |304|NOT MODIFIED       |Your client's cached version of the representation is still up to date|
  |401|UNAUTHORIZED       |The supplied credentials, if any, are not sufficient to access the resource|
  |404|NOT FOUND          |The requested representation was not found. Retrying this request is unlikely to be successful|
  |429|TOO MANY REQUESTS  |Your application is sending too many simultaneous requests|
  |500|SERVER ERROR       |An internal server error prevented return of the representation response|
  |503|SERVICE UNAVAILABLE|We are temporarily unable to return the representation. Please wait and try again later|

  ### Search (GET) Operation Statuses

  |**Code**|**Meaning**   |**OperationOutcome** in response?|**Description**|
  |:--:|:-----------------|:----------------------------------|:----------------------------------|
  |200|OK                 |Yes, when there are additional messages about a match result|The request was successful, and the response body contains the representation requested|
  |302|FOUND              |No |A common redirect response; you can GET the representation at the URI in the Location response header|
  |400|BAD REQUEST        |Yes|Incorrect search parameters or malformed request - see diagnostics in OperationOutcome|
  |401|UNAUTHORIZED       |The supplied credentials, if any, are not sufficient to access the resource|
  |429|TOO MANY REQUESTS  |No |Your application is sending too many simultaneous requests|
  |500|SERVER ERROR       |No |An internal server error prevented return of the representation response|
  |503|SERVICE UNAVAILABLE|No |The server is temporarily unable to return the representation. Please wait and try again later|

  ### Create (POST or PUT) Operation Statuses

  |**Code**|**Meaning**|**Description**|
  |:--:|:-----------------|:--|
  |200|OK                 |The request was successful, and the resource was updated. The response body contains the updated representation|
  |201|CREATED            |The request was successful, a new resource was created, and the response body contains the representation|
  |204|OK - NO CONTENT    |The request was successful, but no content is returned in the response. In reality this is seldom used for REST APIs and more typically for process APIs. Should include a `Location` header indicating the location of an associated relevant resource|
  |207|MULTI STATUS       |The HTTP 207 Multi-Status response code indicates that there might be a mixture of responses.|
  |400|BAD REQUEST        |The data given in the POST or PUT failed validation. Inspect the response body for details|
  |401|UNAUTHORIZED       |The supplied credentials, if any, are not sufficient to create or update the resource|
  |404|NOT FOUND          |The endpoint that the API Consumer is attempting to create or update does not exist. Retrying this request is unlikely to be successful|
  |405|METHOD NOT ALLOWED |You can't POST or PUT to the resource|
  |422|UNPROCESSABLE CONTENT|The server understands the requests content and syntax however it is unable to process the instruction. Retrying this request will not succeed - the request must be modified|
  |429|TOO MANY REQUESTS  |Your application is sending too many simultaneous requests|
  |500|SERVER ERROR       |We couldn't create or update the resource. Please try again later|

  ### Delete (DELETE) Operation Statuses

  |**Code**|**Meaning**|**Description**|
  |:--:|:-----------------|:--|
  |204|OK                 |The request was successful; the resource was deleted|
  |401|UNAUTHORIZED       |The supplied credentials, if any, are not sufficient to delete the resource|
  |404|NOT FOUND          | |
  |405|METHOD NOT ALLOWED |You can't DELETE the resource|
  |429|TOO MANY REQUESTS  |Your application is sending too many simultaneous requests|
  |500|SERVER ERROR       |We couldn't delete the resource. Please try again later|


  ### Non existent API endpoints

  When a consumer attempts to call a non-existent API end point, respond
  with a **501 Not Implemented** status code.
"""