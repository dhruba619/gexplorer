package org.genealogy.explorer.json;

import java.util.List;

public class Node {
    public Integer key;
    public List<Node> children;
 
    public Node(Integer value) {
        this.key = value;
    }  
}