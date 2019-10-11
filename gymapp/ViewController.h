//
//  ViewController.h
//  gymapp
//
//  Created by Devgan-Mac on 10/10/19.
//  Copyright © 2019 Devgan-Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, retain) IBOutlet UITableView* myTable;
@property (nonatomic, retain) NSMutableArray *arrTrainer;
@property (nonatomic, retain) NSMutableArray *arrsaveindex;
@end

