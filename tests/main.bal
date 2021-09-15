 // main_test.bal
 import ballerina/test;
 import ballerina/http;

 // This test function tests the behavior of the `getRandomJoke` when
 // the API returns a successful response.
 @test:Config {}
 function testGetRandomJoke() {
     // Create a default mock HTTP Client and assign it to the `clientEndpoint`
     //tmdb = test:mock(http:Client);
     // Stub the behavior of the `get` function to return the specified mock response.
 }

 // Returns a mock HTTP response to be used for the jokes API invocation.
 function getMockResponse() returns http:Response {
     http:Response mockResponse = new;
     json mockPayload = {"value":"When Chuck Norris wants an egg, he cracks open a chicken."};
     mockResponse.setPayload(mockPayload);
     return mockResponse;
 }
