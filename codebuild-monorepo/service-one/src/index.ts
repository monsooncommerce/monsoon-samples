import * as AWS from 'aws-sdk';
import { Callback, Context, Handler } from 'aws-lambda';

const kinesis = new AWS.Kinesis({region: process.env.AWS_DEFAULT_REGION});
const streamName = process.env.SERVICE_TWO_STREAM;

const handler: Handler = (event: any, context: Context, callback: Callback): void => {
  console.log("[ServiceOne] received event: %j", event);

  if (process.env.NODE_ENV === 'production') {
      const records: AWS.Kinesis.PutRecordsRequestEntryList = [{
        Data: JSON.stringify(event),
        PartitionKey: Date.now().toString()
      }];

    const params: AWS.Kinesis.Types.PutRecordsInput = {
      Records: records,
      StreamName: streamName
    };

    kinesis.putRecords(params).promise();

    console.log('[ServiceOne] wrote %d records to Kinesis Stream %s', records.length, streamName);
  }
  callback(null, 'success');
};

export { handler }
