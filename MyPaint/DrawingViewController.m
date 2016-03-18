//
//  DrawingViewController.m
//  MyPaint
//
//  Created by Valentina Chernoeva on 03.02.16.
//  Copyright © 2016 Valentina Chernoeva. All rights reserved.
//

#import "DrawingViewController.h"
#import "DrawingCommands.h"
#import "DrawingProperty.h"
#import "InteractivePainterView.h"
#import <iOS-Color-Picker/FCColorPickerViewController.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "CommandExecutor.h"

@interface DrawingViewController () <FCColorPickerViewControllerDelegate>

@property (weak, nonatomic) IBOutlet InteractivePainterView *painterView;
@property (weak, nonatomic) IBOutlet UILabel *lineWidthLabel;
@property (weak, nonatomic) IBOutlet UISlider *lineWidthSlider;
@property (weak, nonatomic) IBOutlet UIButton *colorButton;
@property (weak, nonatomic) IBOutlet UIButton *shapeButton;

@end

@implementation DrawingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createBindings];
    self.painterView.drawingProperty = [[DrawingProperty alloc] initWithColor:self.colorButton.backgroundColor
                                                                    lineWidth:@(self.lineWidthSlider.value)];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self.painterView setNeedsDisplay];
}

#pragma mark - Actions

- (IBAction)onClearButtonTap:(UIButton *)sender {
    [self.painterView clearView];
}

- (IBAction)onUndoButtonTap:(UIButton *)sender {
    [self.painterView undoCommand];
}

- (IBAction)onColorButtonTap:(UIButton *)sender {
    FCColorPickerViewController *colorPicker = [FCColorPickerViewController colorPicker];
    colorPicker.color = self.painterView.drawingProperty.color;
    colorPicker.delegate = self;
    
    [colorPicker setModalPresentationStyle:UIModalPresentationFormSheet];
    [self presentViewController:colorPicker animated:YES completion:nil];
}


- (IBAction)onShapeButtonTap:(UIButton *)sender {
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"Shape" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:ac animated:YES completion:nil];

    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"line" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.painterView.shapeType = ShapeLine;
        [self.shapeButton setImage:[UIImage imageNamed:@"Line"] forState:UIControlStateNormal];
        [ac dismissViewControllerAnimated:YES completion:nil];
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"rectangle" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.painterView.shapeType = ShapeRect;
        [self.shapeButton setImage:[UIImage imageNamed:@"Rect"] forState:UIControlStateNormal];
        [ac dismissViewControllerAnimated:YES completion:nil];
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"pencil" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.painterView.shapeType = ShapePencil;
        [self.shapeButton setImage:[UIImage imageNamed:@"Pencil"] forState:UIControlStateNormal];
        [ac dismissViewControllerAnimated:YES completion:nil];
    }];
    [ac addAction:action1];
    [ac addAction:action2];
    [ac addAction:action3];
}

#pragma mark - FCColorPickerViewControllerDelegate

-(void)colorPickerViewController:(FCColorPickerViewController *)colorPicker didSelectColor:(UIColor *)color {
    self.colorButton.backgroundColor = color;
    self.painterView.drawingProperty.color = color;
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)colorPickerViewControllerDidCancel:(FCColorPickerViewController *)colorPicker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - RAC

- (void)createBindings {
    RAC(self.lineWidthLabel, text) = [[self.lineWidthSlider rac_newValueChannelWithNilValue:@(self.lineWidthSlider.value)] map:^id(NSNumber *value) {
        self.painterView.drawingProperty.lineWidth = value;
        return [NSString stringWithFormat:@"line width: %1.1f", value.floatValue];
    }];
}

@end
