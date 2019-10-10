//
//  ViewController.m
//  gymapp
//
//  Created by Devgan-Mac on 10/10/19.
//  Copyright © 2019 Devgan-Mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
      [super viewDidLoad];
      _arrTrainer = [self JSONFromFile];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
      return 1;    //count of section
}
#pragma mark Table Delegates
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

      return _arrTrainer.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
      static NSString *MyIdentifier = @"cell";
      UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
      if (cell == nil)
      {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:MyIdentifier];
      }
      NSDictionary * dic = [_arrTrainer objectAtIndex:indexPath.row];
      [self setBorderShadow:cell];
      [self setvalues:cell fordata:dic];
      return cell;
}
#pragma mark Set tablecell data
- (void)setBorderShadow:(UITableViewCell *)cell
{
      UIView * viewMainbackground = [cell viewWithTag:1];
      [viewMainbackground.layer setCornerRadius:7.0f];
      [viewMainbackground.layer setBorderColor:[UIColor colorWithRed:234.0/255.0 green:234.0/255.0 blue:234.0/255.0 alpha:1.0].CGColor];
      [viewMainbackground.layer setBorderWidth:1.0f];
      [viewMainbackground.layer setShadowColor:[UIColor colorWithRed:234.0/255.0 green:234.0/255.0 blue:234.0/255.0 alpha:1.0].CGColor];
      [viewMainbackground.layer setShadowOpacity:0.5];
      [viewMainbackground.layer setShadowRadius:1.0];
      [viewMainbackground.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
            //line Weight loss
      UIView * viewWeightloss = [cell viewWithTag:2];
      [viewWeightloss.layer setCornerRadius:7.0f];
      [viewWeightloss.layer setBorderColor:[UIColor colorWithRed:234.0/255.0 green:234.0/255.0 blue:234.0/255.0 alpha:1.0].CGColor];
      [viewWeightloss.layer setBorderWidth:2.0f];
      UIView * viewWeightlossinner = [cell viewWithTag:10];
      [viewWeightlossinner.layer setCornerRadius:7.0f];
      [viewWeightlossinner.layer setBorderColor:[UIColor colorWithRed:234.0/255.0 green:234.0/255.0 blue:234.0/255.0 alpha:1.0].CGColor];
      [viewWeightlossinner.layer setBorderWidth:2.0f];
            //line Muscle
      UIView * viewlineMuscle = [cell viewWithTag:3];
      [viewlineMuscle.layer setCornerRadius:7.0f];
      [viewlineMuscle.layer setBorderColor:[UIColor colorWithRed:234.0/255.0 green:234.0/255.0 blue:234.0/255.0 alpha:1.0].CGColor];
      [viewlineMuscle.layer setBorderWidth:2.0f];
      UIView * viewlineMuscleinner = [cell viewWithTag:20];
      [viewlineMuscleinner.layer setCornerRadius:7.0f];
      [viewlineMuscleinner.layer setBorderColor:[UIColor colorWithRed:234.0/255.0 green:234.0/255.0 blue:234.0/255.0 alpha:1.0].CGColor];
      [viewlineMuscleinner.layer setBorderWidth:2.0f];
            //line Strength
      UIView * viewlineStrength = [cell viewWithTag:4];
      [viewlineStrength.layer setCornerRadius:7.0f];
      [viewlineStrength.layer setBorderColor:[UIColor colorWithRed:234.0/255.0 green:234.0/255.0 blue:234.0/255.0 alpha:1.0].CGColor];
      [viewlineStrength.layer setBorderWidth:2.0f];
      UIView * viewlineStrengthinner = [cell viewWithTag:30];
      [viewlineStrengthinner.layer setCornerRadius:7.0f];
      [viewlineStrengthinner.layer setBorderColor:[UIColor colorWithRed:234.0/255.0 green:234.0/255.0 blue:234.0/255.0 alpha:1.0].CGColor];
      [viewlineStrengthinner.layer setBorderWidth:2.0f];
            //line Fitness
      UIView * viewlineFitness = [cell viewWithTag:5];
      [viewlineFitness.layer setCornerRadius:7.0f];
      [viewlineFitness.layer setBorderColor:[UIColor colorWithRed:234.0/255.0 green:234.0/255.0 blue:234.0/255.0 alpha:1.0].CGColor];
      [viewlineFitness.layer setBorderWidth:2.0f];
      UIView * viewlineFitnessinner = [cell viewWithTag:40];
      [viewlineFitnessinner.layer setCornerRadius:7.0f];
      [viewlineFitnessinner.layer setBorderColor:[UIColor colorWithRed:234.0/255.0 green:234.0/255.0 blue:234.0/255.0 alpha:1.0].CGColor];
      [viewlineFitnessinner.layer setBorderWidth:2.0f];
}
#pragma mark Set tablecell values
- (void)setvalues:(UITableViewCell *)cell fordata:(NSDictionary*)dic
{
      NSString * name = [dic valueForKey:@"name"];
      NSDictionary * Diccode_name = [dic valueForKey:@"trainer"];
      NSString * code_name = [Diccode_name valueForKey:@"name"];
      NSArray * attribute = [dic valueForKey:@"attributes"];
      //images
      UIImageView * img = [cell viewWithTag:100];
      UIImageView * imgdrop1 = [cell viewWithTag:101];
      UIImageView * imgdrop2 = [cell viewWithTag:102];
      UIImageView * imgdrop3 = [cell viewWithTag:103];
      //Lables
      UILabel * lblname = [cell viewWithTag:200];
      UILabel * lblcodename = [cell viewWithTag:201];
      UILabel * lblwloss = [cell viewWithTag:202];
      UILabel * lblmuscle = [cell viewWithTag:203];
      UILabel * lblstrength = [cell viewWithTag:204];
      UILabel * lblfitness = [cell viewWithTag:205];
      //lable values
      lblname.text = name;
      lblcodename.text = [NSString stringWithFormat:@"with %@",code_name];
      dispatch_async(dispatch_get_global_queue(0,0), ^{
            NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [Diccode_name valueForKey:@"image_url"]]];
            if ( data == nil )
                  return;
            dispatch_async(dispatch_get_main_queue(), ^{
                  img.image = [UIImage imageWithData: data];
            });
      });

      for (int i = 0; i < [attribute count]; i++)
      {
            NSDictionary * ff = [attribute objectAtIndex:i];
            NSString * name = [ff valueForKey:@"name"];
            NSString * total = [ff valueForKey:@"total"];
            NSString * value = [ff valueForKey:@"value"];
            if (i == 1)
            {
                  lblwloss.text = name;
            }
            if (i == 2)
            {
                  lblmuscle.text = name;
            }
            if (i == 3)
            {
                  lblstrength.text = name;
            }
            if (i == 4)
            {
                  lblfitness.text = name;
            }
      }
}
- (NSDictionary *)JSONFromFile
{
      NSString *path = [[NSBundle mainBundle] pathForResource:@"trainer-programs" ofType:@"json"];
      NSData *data = [NSData dataWithContentsOfFile:path];
      return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

@end
