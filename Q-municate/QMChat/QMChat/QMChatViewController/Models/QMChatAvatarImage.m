//
//  QMChatAvatarImage.m
//  QMChat
//
//  Created by Andrey Ivanov on 22.04.15.
//  Copyright (c) 2015 QuickBlox Team. All rights reserved.
//

#import "QMChatAvatarImage.h"

@implementation QMChatAvatarImage
#pragma mark - Initialization

+ (instancetype)avatarWithImage:(UIImage *)image {
    
    NSParameterAssert(image != nil);
    
    return [[QMChatAvatarImage alloc] initWithAvatarImage:image
                                         highlightedImage:image
                                         placeholderImage:image];
}

+ (instancetype)avatarImageWithPlaceholder:(UIImage *)placeholderImage {
    
    return [[QMChatAvatarImage alloc] initWithAvatarImage:nil
                                         highlightedImage:nil
                                         placeholderImage:placeholderImage];
}

- (instancetype)initWithAvatarImage:(UIImage *)avatarImage
                   highlightedImage:(UIImage *)highlightedImage
                   placeholderImage:(UIImage *)placeholderImage {
    
    NSParameterAssert(placeholderImage != nil);
    
    self = [super init];
    if (self) {
        _avatarImage = avatarImage;
        _avatarHighlightedImage = highlightedImage;
        _avatarPlaceholderImage = placeholderImage;
    }
    return self;
}

- (id)init {
    
    NSAssert(NO, @"%s is not a valid initializer for %@. Use %@ instead.",
             __PRETTY_FUNCTION__, [self class], NSStringFromSelector(@selector(initWithAvatarImage:highlightedImage:placeholderImage:)));
    return nil;
}

#pragma mark - NSObject

- (NSString *)description {
    
    return [NSString stringWithFormat:@"<%@: avatarImage=%@, avatarHighlightedImage=%@, avatarPlaceholderImage=%@>",
            [self class], self.avatarImage, self.avatarHighlightedImage, self.avatarPlaceholderImage];
}

- (id)debugQuickLookObject {
    
    return [[UIImageView alloc] initWithImage:self.avatarImage ?: self.avatarPlaceholderImage];
}

#pragma mark - NSCopying

- (instancetype)copyWithZone:(NSZone *)zone {
    
    return [[[self class] allocWithZone:zone] initWithAvatarImage:[UIImage imageWithCGImage:self.avatarImage.CGImage]
                                                 highlightedImage:[UIImage imageWithCGImage:self.avatarHighlightedImage.CGImage]
                                                 placeholderImage:[UIImage imageWithCGImage:self.avatarPlaceholderImage.CGImage]];
}

@end