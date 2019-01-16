#import <Foundation/Foundation.h>

@interface Searcher : NSObject

-(int) linearSearch: (int *) arr: (int) size: (int) target;

@end

@implementation Searcher

-(int) linearSearch: (int *) arr: (int) size: (int) target {
    int i;
    for (i = 0; i< size; i++) {
        if (arr[i] == target)
        return i;
    }
    return -1;
}

-(int) binarySearch: (int *) arr: (int) size: (int) x {
    int l = 0;
    int r = size -1;

    while (l <= r) { 
        int m = l + (r - l) / 2; 
  
        if (arr[m] == x) 
            return m; 
  
        if (arr[m] < x) 
            l = m + 1; 
  
        else
            r = m - 1; 
    } 
    return -1; 
}
@end

@interface Tuple : NSObject {
    double x1;
    double x2;
    bool hasSolution;
}

@property double x1;
@property double x2;
@property bool hasSolution;
@end

@implementation Tuple
@synthesize x1, x2, hasSolution;
@end

@interface Calculator : NSObject

+(double) abs: (double) d;

+(double) sqrt: (double) d;

-(Tuple *) solveQuadratic: (double) a : (double) b : (double) c;
@end

@implementation Calculator

+ (double) abs: (double) d {
    if (d < 0) return -d;
    return d;
}

+(double) sqrt: (double) x {
    double r = 1.0;

    while  ( abs((r * r) / x  - 1.0) >= 0.0001 ) {
        r = ((x/r) + r) / 2;

    }

    return r;
}

-(Tuple *) solveQuadratic: (double) a : (double) b : (double) c {
    double delta = b*b - 4*a*c;
    Tuple *t = [[Tuple alloc] init];
    if (delta < 0) {
        t.hasSolution = false;
    } else {
        t.hasSolution = true;
        t.x1 = (-b -sqrt(delta))/(2*a);
        t.x2 = (-b +sqrt(delta))/(2*a);
    }

    return t;
}

@end

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int arr[10] = {1,2,3,4,5,6,7,8,9,10};
    int n;
    NSLog(@"What are you searching for?");
    scanf("%d", &n);
    Searcher *searcher = [[Searcher alloc] init];
    NSLog(@"Begin!");
    NSLog(@"Number %i is located at index %i using linear search", n, [searcher linearSearch: arr : 10 : n]);
    NSLog(@"Number %i is located at index %i using binary search", n, [searcher binarySearch: arr : 10 : n]);  
    
    Calculator *cal = [[Calculator alloc] init];

    NSLog(@"2*x^2 + 5*x -10 = 0");
    double x = 2, y = 5, z = -10;
    
    Tuple *res = [cal solveQuadratic: x : y: z];

    if (!res.hasSolution) NSLog(@"No value!");
    else NSLog(@"x1 = %e; x2 = %e", res.x1, res.x2);
    [pool drain];
    return 0;
}