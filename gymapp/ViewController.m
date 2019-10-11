//
//  ViewController.m
//  gymapp
//
//  Created by Devgan-Mac on 10/10/19.
//  Copyright © 2019 Devgan-Mac. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
      [super viewDidLoad];
      _arrTrainer = [self JSONFromFile];
      NSLog(@"%@",_arrTrainer);
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
      NSLog(@"%@",dic);
      [self setBorderShadow:cell];
      [self setimages:cell fordata:dic];
      [self setslidersandLablesvalues:cell fordata:dic];

      [self settagsatbottomCell:cell fordata:dic];
      return cell;
}
#pragma mark Set tags at bottom of cell
- (void)settagsatbottomCell:(UITableViewCell *)cell fordata:(NSDictionary*)dic
{

      for(UIView *bgview in [cell.contentView subviews])
            {

            for(UILabel *lbl in [bgview subviews])
                  {
                  if([lbl isKindOfClass:[UILabel class]]){
                        if ([lbl tag] == 90)
                              {
                              [lbl removeFromSuperview];
                              }
                        else if ([lbl tag] == 91)
                              {
                              [lbl removeFromSuperview];
                              }
                        else if ([lbl tag] == 92)
                              {
                              [lbl removeFromSuperview];
                              }
                        else if ([lbl tag] == 93)
                              {
                              [lbl removeFromSuperview];
                              }
                        else if ([lbl tag] == 94)
                              {
                              [lbl removeFromSuperview];
                              }
                        else if ([lbl tag] == 95)
                              {
                              [lbl removeFromSuperview];
                              }

                  }


                  }

            }
      UIView * viewbgcell = [cell viewWithTag:1];
      UIView * viewlineFitness = [cell viewWithTag:5];
      NSArray * arrtags = [dic valueForKey:@"tags"];
      NSLog(@"%@",arrtags);
      float saveWidth = 0.0;
      float savestartAxis = 0.0;
      for (int i = 0; i < [arrtags count]; i++)
      {
            NSDictionary * dict = [arrtags objectAtIndex:i];
            NSString * name = [dict valueForKey:@"name"];
            if (i > 5)
            {
            if (i == 6)
                  {
                  UILabel * lblname = [[UILabel alloc] initWithFrame:CGRectMake(15, viewlineFitness.frame.origin.y + viewlineFitness.frame.size.height + 65, 80, 25)];
                  lblname.text = name;
                  lblname.tag = 95;
                  [lblname setTextAlignment:UITextAlignmentCenter];
                  [lblname setFont:[UIFont fontWithName:@"OpenSans-Bold" size:10]];
                  lblname.textColor = [UIColor colorWithRed:146.0/255.0 green:146.0/255.0 blue:146.0/255.0 alpha:1.0];
                  [lblname.layer setCornerRadius:4.0f];
                  [lblname.layer setBorderColor:[UIColor colorWithRed:198.0/255.0 green:198.0/255.0 blue:198.0/255.0 alpha:1.0].CGColor];
                  [lblname.layer setBorderWidth:1.0f];
                  CGFloat width =  [lblname.text sizeWithFont:[UIFont fontWithName:@"OpenSans-Bold" size:10 ]].width;
                  lblname.frame = CGRectMake(lblname.frame.origin.x, viewlineFitness.frame.origin.y + viewlineFitness.frame.size.height + 70, width + 10, 25);
                  saveWidth = width;
                  savestartAxis = lblname.frame.origin.x;
                  [viewbgcell addSubview:lblname];
                  }
            else
                  {
                  UILabel * lblname = [[UILabel alloc] initWithFrame:CGRectMake((saveWidth + savestartAxis) + 15, viewlineFitness.frame.origin.y + viewlineFitness.frame.size.height + 70, 80, 25)];
                  lblname.tag = 94;
                  lblname.text = name;
                  [lblname setFont:[UIFont fontWithName:@"OpenSans-Bold" size:10]];
                  lblname.textColor = [UIColor colorWithRed:146.0/255.0 green:146.0/255.0 blue:146.0/255.0 alpha:1.0];
                  [lblname setTextAlignment:UITextAlignmentCenter];
                  [lblname.layer setCornerRadius:4.0f];
                  [lblname.layer setBorderColor:[UIColor colorWithRed:198.0/255.0 green:198.0/255.0 blue:198.0/255.0 alpha:1.0].CGColor];
                  [lblname.layer setBorderWidth:1.0f];

                  CGFloat width =  [lblname.text sizeWithFont:[UIFont fontWithName:@"OpenSans-Bold" size:10 ]].width;
                  lblname.frame = CGRectMake(lblname.frame.origin.x, viewlineFitness.frame.origin.y + viewlineFitness.frame.size.height + 70, 10 + width, 25);
                  saveWidth = width;
                  savestartAxis = lblname.frame.origin.x;
                  [viewbgcell addSubview:lblname];
                  }

            }
           else  if (i > 2)
            {
                  if (i == 3)
                  {
                        UILabel * lblname = [[UILabel alloc] initWithFrame:CGRectMake(15, viewlineFitness.frame.origin.y + viewlineFitness.frame.size.height + 40, 80, 25)];
                        lblname.text = name;
                        lblname.tag = 93;
                        [lblname setTextAlignment:UITextAlignmentCenter];
                        [lblname setFont:[UIFont fontWithName:@"OpenSans-Bold" size:10]];
                        lblname.textColor = [UIColor colorWithRed:146.0/255.0 green:146.0/255.0 blue:146.0/255.0 alpha:1.0];
                        [lblname.layer setCornerRadius:4.0f];
                        [lblname.layer setBorderColor:[UIColor colorWithRed:198.0/255.0 green:198.0/255.0 blue:198.0/255.0 alpha:1.0].CGColor];
                        [lblname.layer setBorderWidth:1.0f];

                  CGFloat width =  [lblname.text sizeWithFont:[UIFont fontWithName:@"OpenSans-Bold" size:10 ]].width;
                  lblname.frame = CGRectMake(lblname.frame.origin.x, viewlineFitness.frame.origin.y + viewlineFitness.frame.size.height + 40, 10 + width, 25);
                  saveWidth = width;
                  savestartAxis = lblname.frame.origin.x;
                        [viewbgcell addSubview:lblname];
                  }
                  else
                  {
                        UILabel * lblname = [[UILabel alloc] initWithFrame:CGRectMake((saveWidth + savestartAxis) + 15, viewlineFitness.frame.origin.y + viewlineFitness.frame.size.height + 40, 80, 25)];
                        lblname.tag = 92;
                        lblname.text = name;
                        [lblname setTextAlignment:UITextAlignmentCenter];
                        [lblname setFont:[UIFont fontWithName:@"OpenSans-Bold" size:10]];
                        lblname.textColor = [UIColor colorWithRed:146.0/255.0 green:146.0/255.0 blue:146.0/255.0 alpha:1.0];
                        [lblname.layer setCornerRadius:4.0f];
                        [lblname.layer setBorderColor:[UIColor colorWithRed:198.0/255.0 green:198.0/255.0 blue:198.0/255.0 alpha:1.0].CGColor];
                        [lblname.layer setBorderWidth:1.0f];

                  CGFloat width =  [lblname.text sizeWithFont:[UIFont fontWithName:@"OpenSans-Bold" size:10 ]].width;
                  lblname.frame = CGRectMake(lblname.frame.origin.x, viewlineFitness.frame.origin.y + viewlineFitness.frame.size.height + 40, 10 + width, 25);
                  saveWidth = width;
                  savestartAxis = lblname.frame.origin.x;
                        [viewbgcell addSubview:lblname];
                  }

            }
            else
            {
                  if (i == 0)
                  {
                  UILabel * lblname = [[UILabel alloc] initWithFrame:CGRectMake(15, viewlineFitness.frame.origin.y + viewlineFitness.frame.size.height + 10, 80, 25)];
                  lblname.tag = 90;
                  lblname.text = name;
                  [lblname setTextAlignment:UITextAlignmentCenter];
                  lblname.numberOfLines = 0;
                  lblname.tag = 90;
                  lblname.text = name;
                        ///
                  [lblname setFont:[UIFont fontWithName:@"OpenSans-Bold" size:10]];
                  lblname.textColor = [UIColor colorWithRed:146.0/255.0 green:146.0/255.0 blue:146.0/255.0 alpha:1.0];
                  [lblname.layer setCornerRadius:4.0f];
                  [lblname.layer setBorderColor:[UIColor colorWithRed:198.0/255.0 green:198.0/255.0 blue:198.0/255.0 alpha:1.0].CGColor];
                  [lblname.layer setBorderWidth:1.0f];
                  CGFloat width =  [lblname.text sizeWithFont:[UIFont fontWithName:@"OpenSans-Bold" size:10 ]].width;
                  lblname.frame = CGRectMake(15, viewlineFitness.frame.origin.y + viewlineFitness.frame.size.height + 10, 10 + width, 25);
                  saveWidth = width;
                  savestartAxis = lblname.frame.origin.x;

                  [viewbgcell addSubview:lblname];
                  }
                  else
                  {
                  UILabel * lblname = [[UILabel alloc] initWithFrame:CGRectMake((saveWidth + savestartAxis) + 15, viewlineFitness.frame.origin.y + viewlineFitness.frame.size.height + 10, 80, 25)];
                  lblname.tag = 91;
                  lblname.text = name;
                  [lblname setTextAlignment:UITextAlignmentCenter];
                  [lblname setFont:[UIFont fontWithName:@"OpenSans-Bold" size:10]];
                  lblname.textColor = [UIColor colorWithRed:146.0/255.0 green:146.0/255.0 blue:146.0/255.0 alpha:1.0];
                  [lblname.layer setCornerRadius:4.0f];
                  [lblname.layer setBorderColor:[UIColor colorWithRed:198.0/255.0 green:198.0/255.0 blue:198.0/255.0 alpha:1.0].CGColor];
                  [lblname.layer setBorderWidth:1.0f];
                  //
                  CGFloat width =  [lblname.text sizeWithFont:[UIFont fontWithName:@"OpenSans-Bold" size:10 ]].width;
                  lblname.frame = CGRectMake(lblname.frame.origin.x, viewlineFitness.frame.origin.y + viewlineFitness.frame.size.height + 10, width + 10, 25);
                  saveWidth = width;
                  savestartAxis = lblname.frame.origin.x;
                  ///
                  [viewbgcell addSubview:lblname];
                  }
            }

      }
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
#pragma mark Set tablecell sliders values
- (void)setslidersandLablesvalues:(UITableViewCell *)cell fordata:(NSDictionary*)dic
{

      UIView * viewWeightloss = [cell viewWithTag:2];
      UIView * viewWeightlossinner = [cell viewWithTag:10];

      UIView * viewlineMuscle = [cell viewWithTag:3];
      UIView * viewlineMuscleinner = [cell viewWithTag:20];

      UIView * viewlineStrength = [cell viewWithTag:4];
      UIView * viewlineStrengthinner = [cell viewWithTag:30];

      UIView  * viewlineFitness = [cell viewWithTag:5];
      UIView * viewlineFitnessinner = [cell viewWithTag:40];


      UILabel * lblname = [cell viewWithTag:200];
      UILabel * lblcodename = [cell viewWithTag:201];
      UILabel * lblwloss = [cell viewWithTag:202];
      UILabel * lblmuscle = [cell viewWithTag:203];
      UILabel * lblstrength = [cell viewWithTag:204];
      UILabel * lblfitness = [cell viewWithTag:205];
      NSArray * attribute = [dic valueForKey:@"attributes"];
      NSString * name = [dic valueForKey:@"name"];
      NSDictionary * Diccode_name = [dic valueForKey:@"trainer"];
      NSString * code_name = [Diccode_name valueForKey:@"name"];
      lblname.text = name;
      lblcodename.text = [NSString stringWithFormat:@"with %@",code_name];
      for (int i = 0; i < [attribute count]; i++)
      {
            NSDictionary * ff = [attribute objectAtIndex:i];
            NSString * name = [ff valueForKey:@"name"];
            NSString * total = [ff valueForKey:@"total"];
            NSString * value = [ff valueForKey:@"value"];
            float floatTotal = [total floatValue];
            if (i == 1)
            {
                  lblwloss.text = name;
//                  UIFont *font = lblwloss.font;
//                  lblwloss.font = [font fontWithSize:40];
                  float totalwidthwloss = viewWeightloss.frame.size.width / floatTotal;
                  float slidervalue = totalwidthwloss * [value floatValue];
                  viewWeightlossinner.frame = CGRectMake(viewWeightlossinner.frame.origin.x, viewWeightlossinner.frame.origin.y, slidervalue, viewWeightlossinner.frame.size.height);
            }
            if (i == 2)
            {
                  lblmuscle.text = name;
                  float totalwidthmuscle = viewlineMuscle.frame.size.width / floatTotal;
                  float slidervalue = totalwidthmuscle * [value floatValue];
                  viewlineMuscleinner.frame = CGRectMake(viewlineMuscleinner.frame.origin.x, viewlineMuscleinner.frame.origin.y, slidervalue, viewlineMuscleinner.frame.size.height);
            }
            if (i == 3)
            {
                  lblstrength.text = name;
                  float totalwidthstrength = viewlineStrength.frame.size.width / floatTotal;
                  float slidervalue = totalwidthstrength * [value floatValue];
                  viewlineStrengthinner.frame = CGRectMake(viewlineStrengthinner.frame.origin.x, viewlineStrengthinner.frame.origin.y, slidervalue, viewlineStrengthinner.frame.size.height);
            }
            if (i == 4)
            {
                  lblfitness.text = name;
                  float totalwidthfitness = viewlineFitness.frame.size.width / floatTotal;
                  float slidervalue = totalwidthfitness * [value floatValue];
                  viewlineFitnessinner.frame = CGRectMake(viewlineFitnessinner.frame.origin.x, viewlineFitnessinner.frame.origin.y, slidervalue, viewlineFitnessinner.frame.size.height);
            }
      }
}
#pragma mark Set tablecell values
- (void)setimages:(UITableViewCell *)cell fordata:(NSDictionary*)dic
{
      NSDictionary * Diccode_name = [dic valueForKey:@"trainer"];
      //images
      UIImageView * img = [cell viewWithTag:100];
      UIImageView * imgdrop1 = [cell viewWithTag:101];
      UIImageView * imgdrop2 = [cell viewWithTag:102];
      UIImageView * imgdrop3 = [cell viewWithTag:103];

      [img sd_setImageWithURL:[NSURL URLWithString:[Diccode_name valueForKey:@"image_url"]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
}
- (NSDictionary *)JSONFromFile
{
      NSString *path = [[NSBundle mainBundle] pathForResource:@"trainer-programs" ofType:@"json"];
      NSData *data = [NSData dataWithContentsOfFile:path];
      return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

@end
