
  class PolyTreeNode
    attr_reader :children, :parent, :value

    def initialize(value, parent = nil)
      @children = []
      @parent = parent
      @value = value
    end
  

    def parent=(parent_node)
      #self = child
      if !parent.nil? 
        parent.children.delete(self)
      end
      
      @parent = parent_node

      unless parent.nil? || parent.children.include?(self)
        parent.children << self
      end
      
    end


    def add_child(child)
      #self=parent
      child.parent=(self)
    end

    def remove_child(child)
        
      child.parent=(nil)
      raise "error" if child.parent == nil
    end

    def dfs(value)
      return self if self.value == value

      self.children.each do |child|
        result = child.dfs(value)
        unless result.nil? #if !result.nil
          return result 
        end 
      end   
      nil
    end

   def bfs(target)
        # create a queue
        queue = [self] 
    
        until queue.empty?
          removed_ele = queue.shift
          if removed_ele.value == target
            return removed_ele 
          end
    
          # grab children of the removed_ele
          queue.concat(removed_ele.children)
          
        end
        nil
  end



end




# def bfs(root, target)
    #create a queue
    #add root node to queue

    #loop until our queue is empty
        #remove the first node from the queue
        #check: is this node the target value?
            #if node == target, return node
            #if node != target, add that node's children to our queue and continue loop
        
    #return nil if we never returned out of the loop (never found target)
        
# end


#      a
#    /   \
#   b     c value = red
#  / \   / \
# d   e f   g value = blue
       # value = green
#ARGUMENTS 
    #root = a
    #target = d

#SETUP
    #queue = [a]

#LOOP
    #Is the queue empty? 
    #If not, keep going.

    #ITERATION 1
        #remove first node from queue (node a)
        #queue = []
        #current_node = a
            #is a == d (target)?
                #nope! now we add a's children to the queue
                #queue = [b, c]
    
    #Is the queue empty? No? Keep going. 

    #ITERATION 2
        #remove first node from queue (node b)
        #queue = [c]
        #current_node = b
            #is b == d (our target)?
                #no! now we add b's children to the queue
                #queue = [c, d, e]
    
    #Is the queue empty? Nope, keep going

    #ITERATION 3
        #remove first node from queue (node c)
        #queue = [d, e]
        #current_node = c
            #is c == d? 
                #nope, so we add c's children to the queue
                #queue = [d, e, f, g]

    #Is the queue empty? Nopeee, keep going!

    #ITERATION 4
        #remove node d from the queue
        #queue = [e, f, g]
        #current_node = d
            #is d == d (target)
                #yes! return d
    

# -----------------------------------------------------------


# --------------------
# Depth-first search
# --------------------

#uses a stack data structure, solved with recursion (fun!)

# def dfs(root, target)
    #start at root node, check the node's value
    #if node == target, return node. done!
    #otherwise, recursively call dfs on each of that node's children
        #if the result of the recursive call is not nil, then return the found node
    #return nil if the target wasn't found



# end


#      a
#    /   \
#   b     c
#  / \   / \
# d   e f   g

#STACK FRAME 1 (root = a, target = d)
    #is a's value == d? 
        #nope! recursively call dfs on each of a's children
            #sub_result = dfs(b, target) --> STACK FRAME 2
            #PAUSE until STACK FRAME 2 is resolved...
                #sub_result = d (from STACK FRAME 2)
                #sub_result != nil, so we return d (final result)

#STACK FRAME 2 (root = b, target = d)
    #is b's value == d?
        #no! recursively call dfs on each of b's children
            #sub_result = dfs(d, target) --> STACK FRAME 3
            #PAUSE until STACK FRAME 3 is resolved...
                #sub_result = d (from STACK FRAME 3)
                #sub_result != nil, so we return d to STACK FRAME 1

#STACK FRAME 3 (root = d, target = d)
    #is d's value == d? 
        #sure is! return d to STACK FRAME 2

#-----------
#ALTERNATIVE TARGET

#STACK FRAME 3 (root = d, target = e)
    #is d's value == e? 
        #no! recursively call dfs on all of d's children 
            #since d has no children: hit base case, sub_result == nil        
        




 



  









