//
//  GRViewController.m
//  GitReference
//
//  Created by Jason Kupiec on 4/5/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "GRViewController.h"

static CGFloat margin = 15;
static CGFloat labelHeight = 20;
static NSString * const Command = @"command";
static NSString * const Reference = @"reference";

@interface GRViewController ()

@end

@implementation GRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:scrollView];
    
    CGFloat topMargin = 20;
    CGFloat widthMinusMargin = self.view.frame.size.width - 2 * margin;
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(margin, topMargin, widthMinusMargin, labelHeight)];
    title.font = [UIFont boldSystemFontOfSize:20];
    title.text = @"GitReference";
    [scrollView addSubview:title];
    
    CGFloat top = topMargin + labelHeight + margin * 2;
    
    for (NSDictionary *gitCommand in [self gitCommands]) {
        NSString *command = gitCommand[Command];
        NSString *reference = gitCommand[Reference];
        
        UILabel *gitCommand = [[UILabel alloc]initWithFrame:CGRectMake(margin, top, widthMinusMargin, labelHeight)];
        gitCommand.font = [UIFont boldSystemFontOfSize:18];
        gitCommand.text = command;
        [scrollView addSubview:gitCommand];
        
        top += (labelHeight + margin);
        CGFloat referenceHeight = topMargin + 2;
        
        UILabel *gitReference = [[UILabel alloc]initWithFrame:CGRectMake(margin, top, widthMinusMargin, referenceHeight)];
        gitReference.font = [UIFont systemFontOfSize:15];
        gitReference.text = reference;
        [scrollView addSubview:gitReference];
        
        top += (referenceHeight + margin * 2);
    }
    
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, top);
}

    - (NSArray *)gitCommands {
        return @[@{Command: @"git status", Reference: @": shows changed files"},
                 @{Command: @"git diff", Reference: @": shows actual changes"},
                 @{Command: @"git add .", Reference: @": adds changed files to the commit"},
                 @{Command: @"git commit -m \"notes\"", Reference: @": commits the changes"},
                 @{Command: @"git push origin _branch_", Reference: @": pushes commits to branch named _branch_"},
                 @{Command: @"git log", Reference: @": displays progress log"},
                 @{Command: @"git comment --amend", Reference: @": re-enter last commit message"}
                 ];
    }
    
    - (CGFloat)heightOfRefernceString:(NSString *)reference {
        CGRect bounding = [reference boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 2 * margin, 0)
                                                  options:NSStringDrawingUsesLineFragmentOrigin
                                               attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}
                                                  context:nil];
        
        return bounding.size.height;
        
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
