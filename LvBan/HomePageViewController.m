//
//  HomePageViewController.m
//  LvBan
//
//  Created by 辰 宫 on 14/12/31.
//  Copyright (c) 2014年 overmindgc. All rights reserved.
//

#import "HomePageViewController.h"
#import "NewTripViewController.h"
#import "SingleTripViewController.h"
#import "TripListViewController.h"
#import "HomeViewController.h"

@interface HomePageViewController ()
{
    NSMutableArray *homeViewCollections;
}

@end


@implementation HomePageViewController

@synthesize scrollView;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Configure the page view controller and add it as a child view controller.
    self.view.backgroundColor = [UIColor appMainColor];
    homeViewCollections = [[NSMutableArray alloc] init];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    scrollView.scrollEnabled = YES;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = YES;
    scrollView.alwaysBounceVertical = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];

    
    NewTripViewController *newTripVC = [[NewTripViewController alloc] init];
    [self addChildViewController:newTripVC];
    [newTripVC.view setFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [scrollView addSubview:newTripVC.view];
    [homeViewCollections addObject:newTripVC];
    
    SingleTripViewController *singleTripVC = [[SingleTripViewController alloc] init];
    [self addChildViewController:singleTripVC];
    [singleTripVC.view setFrame:CGRectMake(0, SCREEN_HEIGHT * 1, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [scrollView addSubview:singleTripVC.view];
    [homeViewCollections addObject:singleTripVC];
    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    [self addChildViewController:homeVC];
    [homeVC.view setFrame:CGRectMake(0, SCREEN_HEIGHT * 2, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [scrollView addSubview:homeVC.view];
    [homeViewCollections addObject:homeVC];
    
    TripListViewController *tripListVC = [[TripListViewController alloc] init];
    [self addChildViewController:tripListVC];
    [tripListVC.view setFrame:CGRectMake(0, SCREEN_HEIGHT * 3, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [scrollView addSubview:tripListVC.view];
    [homeViewCollections addObject:tripListVC];
    
    
    [scrollView setContentSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT * homeViewCollections.count)];
    
    [scrollView scrollRectToVisible:CGRectMake(0, SCREEN_HEIGHT * 2, SCREEN_WIDTH, SCREEN_HEIGHT) animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
