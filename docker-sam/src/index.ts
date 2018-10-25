exports.handler = async (event, context, callback) => {
  console.log("received event: ", event);
  callback(null, {
    statusCode: 200,
    body: "OK"
  });
};
