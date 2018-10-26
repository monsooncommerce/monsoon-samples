import * as xml2json from 'xml2json';

exports.handler = async (event, context, callback) => {
  console.log("received event: %j", event);
  const xml = xml2json.toXml(event);
  callback(null, xml);
};
