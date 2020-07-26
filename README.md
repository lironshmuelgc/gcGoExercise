# gcGoExercise

After going over [A Tour of Go](https://tour.golang.org/welcome/1), [How to Write Go Code](https://golang.org/doc/code.html) (briefly), and [Effective Go](https://golang.org/doc/effective_go.html), it’s time to make some real Go services! Your task is to make two services that will communicate over RabbitMQ.

The producer service should:
- Activate a cronjob that runs every 10 seconds.
- Fetch cryptocurrency prices over HTTP, using http://api.coinranking.com/v1/public/coin/{coinID} for coinIDs: 1 (Bitcoin), 2 (Ethereum), 7 (Litecoin), and 13 (Dash).
- Every coin should have its own parallel goroutine worker.
- Send an aggregated message of all the coins to the consumer service over RabbitMQ.

The consumer service should:
- Consume the aggregated message and print it to the screen.
- Bonus: persist that message to a DB.

Ensure the services have sufficient logging.
Additionally, add UTs to validate your code.


To-do list :
- Make a Dockerfile for the Go apps. Make sure you use Go Modules and not dep to get your dependencies. (google it if you not familiar with it)
- To keep your main.go file clean and your code organized - separate concerns:
    - **core/** - business logic.
    - **definition/** - declare all interfaces and global instances you need for dependency injection.
    - **mocks/**
    - **provider/** - defining access remote services over HTTP and RabbitMQ.
- Fill ./pre-commit.sh and run it before you commit.

Pay attention to:
- The producer service should run continuously.
- Wait for all responses when aggregating data.
- Writing concurrently to a single map needs synchronizing.
- In tests mock the providers and inject them to their global instances.

If you need any guidance/assistance, [@liron.shmuel](https://guardicore.slack.com/team/UTHJ9Q2SG) will be glad to help you.
