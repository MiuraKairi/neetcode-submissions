class MinStack {
    init() {
    }
    private var stack: [Int] = []
    // keeps track of the minimum value at each point
    private var minStack: [Int] = []

    func push(_ val: Int) {
        stack.append(val)

        if let currentMin = minStack.last {
            minStack.append(min(val, currentMin))
        } else {
            minStack.append(val)
        }
    }

    func pop() {
        stack.removeLast()
        minStack.removeLast()
    }

    func top() -> Int {
        // I'd rather avoid using force unwrapping (!) in production code,
        // but I'm using it here because this is for competitive programming.
        stack.last!
    }

    func getMin() -> Int {
        // I'd rather avoid using force unwrapping (!) in production code,
        // but I'm using it here because this is for competitive programming.
        minStack.last!
    }
}
