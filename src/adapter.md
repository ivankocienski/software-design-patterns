# Adapter

An adapter class sits between a service consumer and a service provider, translating requests from the consumer to the specific providers. In this manner the consumer has no direct awareness of the specific API the provider exposes but uses a standard set of calls. The adapter class is responsible for presenting to the consumer this specific API.

## Sample Implementation

A media player wants to play a source of media. There also exists a number of media sources (radio and web streaming). Adapter classes wrap the radio and web-streaming classes and provide a uniform API to the media player.
