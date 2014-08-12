//
//  VBCViewController.m
//  Charts
//
//  Created by Volodymyr Boichentsov on 15/02/2014.
//  Copyright (c) 2014 SAKrisT. All rights reserved.
//

#import "VBCViewController.h"
#import "UIColor+HexColor.h"
#import "VBPieChart.h"



@interface VBCViewController ()

@property (nonatomic, retain) VBPieChart *chart;

@property (nonatomic, retain) NSDictionary *chartValues;
@end

@implementation VBCViewController
- (IBAction)valueChangedSlider:(UISlider*)sender {
    
    float value = [sender value];
    
    switch (sender.tag) {
        case 0: {
//            [_chart setFrame:CGRectMake(100, 100, value, value)];
            NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:_chart.chartValues];
            
            NSString *key = [[dict allKeys] objectAtIndex:sender.tag];
            [dict setObject:[NSNumber numberWithFloat:sender.value] forKey:key];
            _chart.chartValues = dict;
        }
            break;
            
        case 1:
            [_chart setRadiusPrecent:value];
            break;
        case 2:
            [_chart setHoleRadiusPrecent:value];
            break;
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setNeedsLayout];
    
    if (!_chart) {
        _chart = [[VBPieChart alloc] init];
        [self.view addSubview:_chart];
    }
    [_chart setFrame:CGRectMake(10, 50, 300, 300)];
    [_chart setEnableStrokeColor:YES];
    [_chart setHoleRadiusPrecent:0.3];
    
    [_chart.layer setShadowOffset:CGSizeMake(2, 2)];
    [_chart.layer setShadowRadius:3];
    [_chart.layer setShadowColor:[UIColor blackColor].CGColor];
    [_chart.layer setShadowOpacity:0.7];
    
    
    self.chartValues = @{
                         @"first": @{@"value":@50, @"color":[UIColor colorWithHexString:@"#dd191d"]},
                         @"second": @{@"value":@20, @"color":[UIColor colorWithHexString:@"#d81b60"]},
                         @"third": @{@"value":@40, @"color":[UIColor colorWithHexString:@"#8e24aa"]},
                         @"fourth 2": @{@"value":@70, @"color":[UIColor colorWithHexString:@"#3f51b5"]},
                         @"fourth 3": @{@"value":@65, @"color":[UIColor colorWithHexString:@"#5677fc"]},
                         @"fourth 4": @{@"value":@23, @"color":[UIColor colorWithHexString:@"#2baf2b"]},
                         @"fourth 5": @{@"value":@34, @"color":[UIColor colorWithHexString:@"#b0bec5"]},
                         @"fourth 6": @{@"value":@54, @"color":[UIColor colorWithHexString:@"#f57c00"]}
                         };
    
    [_chart setChartValues:_chartValues animation:YES];
    
	// Do any additional setup after loading the view, typically from a nib.
}


- (IBAction) growthAll:(id)sender {
    
    [_chart setChartValues:_chartValues animation:YES options:VBPieChartAnimationGrowthAll | VBPieChartAnimationTimingEaseInOut];
}

- (IBAction) growth:(id)sender {
    
    [_chart setChartValues:_chartValues animation:YES duration:1.0 options:VBPieChartAnimationGrowth];
}

- (IBAction) growthBackAll:(id)sender {
    
    [_chart setChartValues:_chartValues animation:YES options:VBPieChartAnimationGrowthBackAll | VBPieChartAnimationTimingEaseInOut];
}

- (IBAction) growthBack:(id)sender {
    
    [_chart setChartValues:_chartValues animation:YES duration:1.0 options:VBPieChartAnimationGrowthBack];
}


- (IBAction) fan:(id)sender {
    
    [_chart setChartValues:_chartValues animation:YES duration:0.35 options:VBPieChartAnimationFan];
}


- (IBAction) fanAll:(id)sender {

    [_chart setChartValues:_chartValues animation:YES options:VBPieChartAnimationFanAll];
}

- (IBAction) changeLenght:(id)sender {
    if (_chart.length < M_PI*2-0.01) {
        _chart.length = M_PI*2;
        _chart.startAngle = 0;
    } else {
        _chart.length = M_PI;
        _chart.startAngle = M_PI;
    }
    
    [_chart setChartValues:_chart.chartValues animation:YES];
    
}


//- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
//
//    UITouch *t = [[touches allObjects] lastObject];
//    CGPoint p1 = [t previousLocationInView:self.view];
//    CGPoint p2 = [t locationInView:self.view];
//    
//    CGPoint delta;
//    delta.x = p1.x - p2.x;
//    delta.y = p1.y - p2.y;
//    
//    _chart.layer.transform = CATransform3DRotate(_chart.layer.transform, delta.y * M_PI / 180.0f, 1, 0, 0);
////    self.layer.transform = CATransform3DRotate(self.layer2.transform, delta.y * M_PI / 180.0f, 1, 0, 0);
//
//    _chart.layer.transform = CATransform3DRotate(_chart.layer.transform, delta.x * M_PI / 180.0f, 0, -1, 0);
////    self.layer2.transform = CATransform3DRotate(self.layer2.transform, delta.x * M_PI / 180.0f, 0, -1, 0);
//
//    
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
