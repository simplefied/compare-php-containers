I was wondering what is the difference between using the official PHP Docker container
and a pure Alpine container with PHP installed from the distribution's repository.
I couldn't find an answer on the internet,
so I wrote a couple of Dockerfiles on different base images
in such a way that they were as similar as possible (in terms of installed interpreter modules).

Here are the results:
```
Modules are the same!

alpine:3.16 based build time: 8 seconds
php:8.0-alpine3.16 based build time: 126 seconds

alpine:3.16 based image size: 34.1MB
php:8.0-alpine3.16 based image size: 95.7MB
```

It seems that using pure Alpine wins in every way.