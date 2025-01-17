import Foundation

// Binary Tree Node Definition
class TreeNode {
    var value: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(value: Int) {
        self.value = value
        self.left = nil
        self.right = nil
    }
}

// Binary Search Tree Implementation
class BinarySearchTree {
    var root: TreeNode?
    
    func insert(value: Int) {
        root = insertNode(root, value: value)
    }
    
    private func insertNode(_ node: TreeNode?, value: Int) -> TreeNode {
        guard let node = node else {
            return TreeNode(value: value)
        }
        
        if value < node.value {
            node.left = insertNode(node.left, value: value)
        } else if value > node.value {
            node.right = insertNode(node.right, value: value)
        }
        
        return node
    }
    
    func search(value: Int) -> Bool {
        return searchNode(root, value: value)
    }
    
    private func searchNode(_ node: TreeNode?, value: Int) -> Bool {
        guard let node = node else { return false }
        
        if value == node.value {
            return true
        } else if value < node.value {
            return searchNode(node.left, value: value)
        } else {
            return searchNode(node.right, value: value)
        }
    }
}

// Usage: Binary Search Tree Search
let bst = BinarySearchTree()
bst.insert(value: 10)
bst.insert(value: 5)
bst.insert(value: 15)
bst.insert(value: 2)
bst.insert(value: 7)

print(bst.search(value: 7))  // true
print(bst.search(value: 20)) // false

// Breadth-First Search Implementation
class BinaryTreeBFS {
    var root: TreeNode?
    
    func bfs(target: Int) -> Bool {
        guard let root = root else { return false }
        
        var queue: [TreeNode] = [root]
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            
            if current.value == target {
                return true
            }
            
            if let left = current.left {
                queue.append(left)
            }
            
            if let right = current.right {
                queue.append(right)
            }
        }
        
        return false
    }
}

// Usage: Breadth-First Search
let bfsTree = BinaryTreeBFS()
bfsTree.root = TreeNode(value: 10)
bfsTree.root?.left = TreeNode(value: 5)
bfsTree.root?.right = TreeNode(value: 15)
bfsTree.root?.left?.left = TreeNode(value: 2)
bfsTree.root?.left?.right = TreeNode(value: 7)

print(bfsTree.bfs(target: 7))  // true
print(bfsTree.bfs(target: 20)) // false

// Depth-First Search Implementation
class BinaryTreeDFS {
    var root: TreeNode?
    
    func dfs(target: Int) -> Bool {
        return dfsHelper(root, target: target)
    }
    
    private func dfsHelper(_ node: TreeNode?, target: Int) -> Bool {
        guard let node = node else { return false }
        
        if node.value == target {
            return true
        }
        
        // Explore left and right
        return dfsHelper(node.left, target: target) || dfsHelper(node.right, target: target)
    }
}

// Usage: Depth-First Search
let dfsTree = BinaryTreeDFS()
dfsTree.root = TreeNode(value: 10)
dfsTree.root?.left = TreeNode(value: 5)
dfsTree.root?.right = TreeNode(value: 15)
dfsTree.root?.left?.left = TreeNode(value: 2)
dfsTree.root?.left?.right = TreeNode(value: 7)

print(dfsTree.dfs(target: 7))  // true
print(dfsTree.dfs(target: 20)) // false
