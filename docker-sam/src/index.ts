import * as xml2json from 'xml2json';
import { Callback, Context, Handler } from 'aws-lambda';

const handler: Handler = (event: any, context: Context, callback: Callback): void => {
  console.log("received event: %j", event);
  const xml = xml2json.toXml(event);
  callback(null, xml);
};

export { handler  }
