const http = require('http');

function testEndpoint(path, expectedStatus) {
  return new Promise((resolve) => {
    const req = http.request({
      hostname: 'localhost',
      port: 3000,
      path: path,
      method: 'GET'
    }, (res) => {
      console.log(`Testing ${path}: ${res.statusCode === expectedStatus ? 'PASS' : 'FAIL'}`);
      resolve(res.statusCode === expectedStatus);
    });
    req.end();
  });
}

async function runTests() {
  console.log('Running basic application tests...');
  const test1 = await testEndpoint('/', 200);
  const test2 = await testEndpoint('/health', 200);
  const test3 = await testEndpoint('/nonexistent', 404);
  
  const passed = test1 && test2 && test3;
  console.log(passed ? 'All tests passed!' : 'Some tests failed!');
  process.exit(passed ? 0 : 1);
}

runTests();
