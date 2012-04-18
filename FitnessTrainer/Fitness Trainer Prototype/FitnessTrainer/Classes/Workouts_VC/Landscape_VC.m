//
//  Landscape_VC.m
//  Trainer
//
//  Created by  andrii on 28.03.12.
//  Copyright (c) 2012 LimeApps. All rights reserved.
//

#import "Landscape_VC.h"

@implementation Landscape_VC

@synthesize isHistory;

#pragma mark - View lifecycle

- (void)viewDidLoad{
    [super viewDidLoad];
    
    content = [[NSMutableDictionary alloc] init];
    
    if(self.isHistory){
        //section 1
        
        NSMutableArray *section_1_array = [NSMutableArray array];
        
        NSMutableDictionary *sub = [NSMutableDictionary dictionary];
        [sub setValue:@"20reps, 30reps, 20reps" forKey:@"detail"];
        [sub setValue:@"Frog Hops" forKey:@"text"];
        [sub setValue:@"Frog Hops" forKey:@"image"];
        
        [section_1_array addObject:sub];
        
        sub = [NSMutableDictionary dictionary];
        [sub setValue:@"10reps/50kg, 8reps/60kg, 12reps/55kg" forKey:@"detail"];
        [sub setValue:@"Leg Press" forKey:@"text"];
        [sub setValue:@"Leg Press" forKey:@"image"];
        
        [section_1_array addObject:sub];
        
        sub = [NSMutableDictionary dictionary];
        [sub setValue:@"10reps/80kg, 8reps/85kg, 6reps/88kg" forKey:@"detail"];
        [sub setValue:@"Barvell Squat" forKey:@"text"];
        [sub setValue:@"Barbell Squat" forKey:@"image"];
        
        [section_1_array addObject:sub];
        
        sub = [NSMutableDictionary dictionary];
        [sub setValue:@"15reps/30kg, 15reps/30kg" forKey:@"detail"];
        [sub setValue:@"One Arm Kettebell Clean" forKey:@"text"];
        [sub setValue:@"One Arm Kettebell Clean" forKey:@"image"];
        
        [section_1_array addObject:sub];
        
        
        sub = [NSMutableDictionary dictionary];
        [sub setValue:@"20reps, 30reps, 20reps" forKey:@"detail"];
        [sub setValue:@"Hurdle Hops" forKey:@"text"];
        [sub setValue:@"Hurdle Hops" forKey:@"image"];
        
        [section_1_array addObject:sub];
        
        sub = [NSMutableDictionary dictionary];
        [sub setValue:@"10reps/40kg, 8reps/50kg, 8reps/45kg" forKey:@"detail"];
        [sub setValue:@"Deadlift" forKey:@"text"];
        [sub setValue:@"Deadlift" forKey:@"image"];
        
        [section_1_array addObject:sub];
        
        sub = [NSMutableDictionary dictionary];
        [sub setValue:@"10reps/40kg, 8reps/50kg, 8reps/45kg" forKey:@"detail"];
        [sub setValue:@"Lying Leg Curls" forKey:@"text"];
        [sub setValue:@"Lying Leg Curls" forKey:@"image"];
        
        [section_1_array addObject:sub];
        
        
        sub = [NSMutableDictionary dictionary];
        [sub setValue:@"10reps/40kg, 8reps/50kg, 8reps/45kg" forKey:@"detail"];
        [sub setValue:@"Deadlift" forKey:@"text"];
        [sub setValue:@"Deadlift" forKey:@"image"];
        
        [section_1_array addObject:sub];
        
        sub = [NSMutableDictionary dictionary];
        [sub setValue:@"10reps/40kg, 8reps/50kg, 8reps/45kg" forKey:@"detail"];
        [sub setValue:@"One-Legged Cable Kickback" forKey:@"text"];
        [sub setValue:@"One-Legged Cable Kickback" forKey:@"image"];
        
        [section_1_array addObject:sub];

        
        [content setObject:section_1_array forKey:@"17/05/12"];
        
        [content setObject:section_1_array forKey:@"10/05/12"];

    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return UIInterfaceOrientationIsLandscape(interfaceOrientation); 
}

- (void)viewWillAppear:(BOOL)animated{
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationChanged:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
}

- (void)viewDidDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
}

-(void)orientationChanged:(id)result{
    [self dismissModalViewControllerAnimated:FALSE];
}

#pragma mark - Table view data source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(self.isHistory)
        return [[content allKeys] objectAtIndex:section];
    
    if(section==0)
        return @"08/05/12";
    else if(section==1)
        return @"09/05/12";    
    else if(section==2)
        return @"12/05/12";  
    else if(section==3)
        return @"13/05/12";
    return @"";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if(self.isHistory)
        return [[content allKeys] count];
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(self.isHistory){
        NSString *key =  [[content allKeys] objectAtIndex:section];
        return [[content objectForKey:key] count];
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.imageView.image = [UIImage imageNamed:@"exercise_fitnes.png"];
        if(self.isHistory){
            cell.detailTextLabel.font = [UIFont systemFontOfSize:13.0f];
        }
    }
    
    if(self.isHistory){
        NSString *key =  [[content allKeys] objectAtIndex:indexPath.section];
        cell.imageView.image =[UIImage imageNamed:[[[content objectForKey:key] objectAtIndex:indexPath.row] valueForKey:@"image"]];
        cell.textLabel.text = [[[content objectForKey:key] objectAtIndex:indexPath.row] valueForKey:@"text"];
        cell.detailTextLabel.text =[[[content objectForKey:key] objectAtIndex:indexPath.row] valueForKey:@"detail"]  ;
    }
    else{
        if(indexPath.section==0){
            cell.imageView.image = [UIImage imageNamed:@"Gym Chest"];
            cell.textLabel.text = @"Gym Chest";
            cell.detailTextLabel.text = @"30 min";  
        }
        else if(indexPath.section==1){
            cell.imageView.image = [UIImage imageNamed:@"running"];
            cell.textLabel.text = @"Running Long Run";
            cell.detailTextLabel.text = @"55 min";
        }
        else if(indexPath.section==2){
            cell.imageView.image = [UIImage imageNamed:@"basketball"];
            cell.textLabel.text = @"Basketball";
            cell.detailTextLabel.text = @"45 min";
        }
        else if(indexPath.section==3){
            cell.imageView.image = [UIImage imageNamed:@"tennis"];
            cell.textLabel.text = @"Tennis Singles";
            cell.detailTextLabel.text = @"70 min";
        }  
    }
    

    
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

#pragma mark - memory management


- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload{
    [super viewDidUnload];
}


@end
