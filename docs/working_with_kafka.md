# Working with Kafka

Start Kafka cluster and Zookeeper:

```
docker-compose up
```

Run Karafka server to consume messages (see `app/consumers` for all consumers):

```
bundle exec karafka server
```

Launch a Rails console and produce a message: (for a real app, use `produce_async`)

```ruby
Karafka.producer.produce_sync(topic: 'example', payload: { 'ping' => 'pong' }.to_json)
```

To view the Karafka Web UI, launch the rails server `bin/rails s`, then navigate to http://localhost:3000/karafka/consumers.

## References

* [Karafka framework documentation](https://karafka.io/docs/)
* [Karafka Getting Started](https://karafka.io/docs/Getting-Started/)
* [Karafka repo](https://github.com/karafka/karafka)
* [Consuming messages](https://karafka.io/docs/Consuming-messages/)
* [Karafka Config](https://github.com/karafka/karafka/blob/master/lib/karafka/setup/config.rb)
* [Routing](https://karafka.io/docs/Routing/)
* [Dead Letter Queue](https://karafka.io/docs/Dead-Letter-Queue/)
* [Avro Deserialization](https://karafka.io/docs/Deserialization/)
