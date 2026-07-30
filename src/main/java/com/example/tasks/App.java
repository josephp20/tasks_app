package com.example.tasks;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class App {

    private static final Logger logger =
            LoggerFactory.getLogger(App.class);

    public static void main(String[] args) {

        logger.info("Application started RUNNING OK");

        Runtime.getRuntime().addShutdownHook(new Thread(() ->
                logger.info("Application is shutting down safely")
        ));

        processTasks();
        keepApplicationRunning();
    }

    private static void processTasks() {
        for (int i = 1; i <= 3; i++) {

            logger.info("Processing task FRONTEND {}", i);

            if (i % 5 == 0) {
                logger.warn(
                        "Task {} is taking longer than expected TEST",
                        i
                );
            }

            if (i % 4 == 0) {
                logger.error(
                        "Task {} failed to process.",
                        i
                );
            }
        }

        logger.info("Initial task processing completed");
    }

    private static void keepApplicationRunning() {
        int heartbeat = 1;

        while (!Thread.currentThread().isInterrupted()) {
            try {
                logger.info(
                        "Application heartbeat {} - service is healthy",
                        heartbeat
                );

                heartbeat++;
                Thread.sleep(10_000);

            } catch (InterruptedException exception) {
                Thread.currentThread().interrupt();
                logger.warn("Application thread was interrupted");
            }
        }
    }
}