/** Keep document replacement outside asynchronous frames. A frame owns the
 * environment, effect pools and draw bindings until its final readback ends. */
export class ViewportTaskQueue {
  private tail: Promise<unknown> = Promise.resolve();
  wrap<A extends unknown[], R>(operation: (...args: A) => R) {
    return (...args: A): Promise<Awaited<R>> => {
      const run = async ():Promise<Awaited<R>> => await operation(...args);
      const task = this.tail.then(run, run);
      this.tail = task.catch(() => undefined);
      return task;
    };
  }
}
