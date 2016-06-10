//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Flatiron School on 6/9/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISShoppingCart.h"
#import "FISItem.h"

@implementation FISShoppingCart

-(NSUInteger) calculateTotalPriceInCents {
    //calculate the sum of price of the price in cents
    //not creating new FISItems bc i have an array of FISItems called items

    NSUInteger sumOfPriceInCents = 0;
    for(NSUInteger i = 0; i < self.items.count; i++) {
        if(self.items.count > 0){
            FISItem *itemFromArray = self.items[i];
            sumOfPriceInCents += itemFromArray.priceInCents;
        }
    }
    return sumOfPriceInCents;
}


-(void) addItem: (FISItem *) item {
    
    [self.items addObject:item];
}
-(void) removeItem: (FISItem *) item {
  
   NSUInteger indexOfItemsArrayItem = [self.items indexOfObject:item];
    [self.items removeObjectAtIndex:indexOfItemsArrayItem];
}

-(void) removeAllItemsLikeItem: (FISItem *) item {
    //i'm just going to leave this here to laugh at what i tried to do before i got it together
//    for(NSUInteger i = 0; i < self.items.count; i++) {
//        FISItem *itemFromArray = self.items[i];
//        if([itemFromArray isEqual:item]) {
            [self.items removeObjectIdenticalTo:item];

}

-(void) sortItemsByNameAsc {
    
    NSSortDescriptor *sortByNameAsc = [NSSortDescriptor sortDescriptorWithKey:@"name"
                                                                    ascending:YES];
    
    [self.items sortUsingDescriptors:@[sortByNameAsc]];
}
-(void) sortItemsByNameDesc {
    NSSortDescriptor *sortByNameDesc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO];
     [self.items sortUsingDescriptors:@[sortByNameDesc]];
}
-(void) sortItemsByPriceInCentsAsc {
    NSSortDescriptor *sortPriceAsc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:YES];
    
       [self.items sortUsingDescriptors:@[sortPriceAsc]];
}
-(void) sortItemsByPriceInCentsDesc {
    
    NSSortDescriptor *sortPriceDesc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:NO];
    
    [self.items sortUsingDescriptors:@[sortPriceDesc]];
    
}
-(NSArray *) allItemsWithName: (NSString *) name {
  
    NSMutableArray *itemsWithMatchingNames = [[NSMutableArray alloc] init];
    
    for(FISItem *eachItem in self.items) {
        if([eachItem.name isEqualToString:name])
            [itemsWithMatchingNames addObject:eachItem];
    }
    return itemsWithMatchingNames;
}
-(NSArray *) allItemsWithMinimumPriceInCents: (NSUInteger) cents {
    
    NSMutableArray *matchMinPrice = [[NSMutableArray alloc]init];
    
        for (FISItem *item in self.items){
                if (item.priceInCents >= cents){
                        [matchMinPrice addObject:item];
                    }
            }
    
      return matchMinPrice;
    return nil;
}
-(NSArray *) allItemsWithMaximumPriceInCents: (NSUInteger) cents {
    NSMutableArray *matchMaxPrice = [[NSMutableArray alloc]init];
    
        for (FISItem *item in self.items){
                if (item.priceInCents <= cents){
                        [matchMaxPrice addObject:item];
                    }
        }
    
    return matchMaxPrice;
    ;
}

@end
