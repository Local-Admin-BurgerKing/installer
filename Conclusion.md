# Conclusion

## MySQL

- Stored procedure params allways with a prefix which does not occur in any table
- Time zone needs to be the same as the one from the accessing host
- Don't use it

## OAS

+ Dont use OneOf! It will mess up all your codegen and noone likes it
+ Everything is a model, do never declare something as more than a ref. It will mess up all your codegen
+ Also define 'native' (`int`,`string`,`boorlen`,etc) as models when they have restrictions (min/max/enum)
+ Use AllOf! Sometimes you will forget how usefull it is; use it
+ Decide between overengeneering (like we did) or only providing things the user needs and also in a way they need

