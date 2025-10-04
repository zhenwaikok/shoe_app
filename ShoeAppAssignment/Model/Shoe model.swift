//
//  Shoe model.swift
//  ShoeShop
//
//  Created by Jei Jason on 24/02/2024.
//

import Foundation

struct Shoe:Identifiable, Hashable{
    var id:String
    var image:String
    var title:String
    var sizes: [String]
    var price: Double
    var description:String
    var category:String
    var best_Popular:String
}


let Shoes:[Shoe] = [
    
    //running shoe
    Shoe(id: "shoe-1",image: "runningShoe1", title: "Li-Ning Dark Horse", sizes: ["UK6", "UK7", "UK8", "UK9"], price: 349, description: "These shoes are the perfect blend of style and performance, designed to take your running experience to the next level. With their sleek design and eye-catching colors, you'll not only stand out on the track but also feel confident and motivated to push your limits.", category: "Running Shoe", best_Popular: "best selling"),
    
    Shoe(id: "shoe-2",image: "runningShoe2", title: "Li-Ning Wujie", sizes: ["UK6", "UK7", "UK8", "UK9"], price: 250, description: "The ultimate choice for runners seeking both style and performance. Crafted with precision and designed with the modern athlete in mind, these shoes are a true game-changer.", category: "Running Shoe", best_Popular: ""),
    
    Shoe(id: "shoe-3",image: "runningShoe3", title: "Li-Ning Jue Ying", sizes: ["UK6", "UK7", "UK8", "UK9"], price: 300, description: "Experience the ultimate combination of style and performance with these sleek and versatile running shoes. Designed specifically for men, these shoes offer a perfect fit and exceptional comfort throughout your run.", category: "Running Shoe", best_Popular: ""),
    
    Shoe(id: "shoe-4",image: "runningShoe4", title: "Li-Ning Furios Rider", sizes: ["UK6", "UK7", "UK8", "UK9"], price: 349, description: "Elevate your running experience with these high-performance shoes from Li Ning. Designed for men who are serious about their fitness journey, these shoes deliver unparalleled comfort, support, and style.", category: "Running Shoe", best_Popular: ""),
    
    Shoe(id: "shoe-5",image: "runningShoe5", title: "Li-Ning Fei Dan", sizes: ["UK6", "UK7", "UK8", "UK9"], price: 349, description: "This shoes have a stylish, strong and impressive design dedicated to sports activities. The product applies advanced technology, helping to create smoothness, support force and reduce foot fatigue.", category: "Running Shoe", best_Popular: "popular"),
    
    //basketball shoe
    Shoe(id: "shoe-6",image: "basketballShoe1", title: "Li-Ning Speed IX", sizes: ["UK6", "UK7", "UK8", "UK9"], price: 509, description: "Elevate your game with these high-performance basketball shoes designed to take you to new heights on the court. The sleek and stylish white, black, and bull red colorway adds a touch of flair to your game.", category: "Basketball Shoe", best_Popular: "best selling"),
    
    Shoe(id: "shoe-7",image: "basketballShoe2", title: "Li-Ning Yu Shuai", sizes: ["UK6", "UK7", "UK8", "UK9"], price: 460, description: "These high-performance footwear from Li-Ning are designed to take your game to the next level.", category: "Basketball Shoe", best_Popular: ""),
    
    Shoe(id: "shoe-8",image: "basketballShoe3", title: "Li-Ning Sonic XI", sizes: ["UK6", "UK7", "UK8", "UK9"], price: 499, description: "Using technology to create outfield basketball shoes, the midsole is divided into front and rear palms beng technology to fill the abdomen, which effectively reduces the impact of landing, and the thin and high-top design effectively protects the ankle.", category: "Basketball Shoe", best_Popular: ""),
    
    Shoe(id: "shoe-9",image: "basketballShoe4", title: "Li-Ning Wade Of Son", sizes: ["UK6", "UK7", "UK8", "UK9"], price: 380, description: "BOOM and CLOUD technology for excellent cushion and responsiveness.Flash-shaped TPU on the side for anti-torsion to boost performanceTUFF OS outsole with flash patterns for solid durability and traction in every direction.", category: "Basketball Shoe", best_Popular: "popular"),
    
    Shoe(id: "shoe-10",image: "basketballShoe5", title: "Li-Ning Sonic 11", sizes: ["UK6", "UK7", "UK8", "UK9"], price: 599, description: "Designed for the modern athlete, these shoes combine style and performance to elevate your game on the court. The vibrant purple colorway, inspired by the iconic South Beach, adds a bold and eye-catching touch to your look.", category: "Basketball Shoe", best_Popular: ""),
    
    //sandal
    Shoe(id: "shoe-11",image: "sandal1", title: "Li-Ning Soft Slides", sizes: ["UK6", "UK7", "UK8", "UK9"], price: 199, description: "Experience the perfect blend of style and comfort with these lifestyle footwear. Designed to provide ultimate relaxation, these slides are a must-have for anyone on-the-go. Whether you're lounging at home or heading out for a casual outing, these slides offer a soft and cushioned feel with every step.", category: "Sandals", best_Popular: ""),
    
    Shoe(id: "shoe-12",image: "sandal2", title: "Li-Ning Badfive Slides", sizes: ["UK6", "UK7", "UK8", "UK9"], price: 110, description: "Elevate your footwear game with these stylish and comfortable slides. Designed specifically for men, these slides are the perfect combination of fashion and functionality. The beige color adds a touch of sophistication to any outfit, making them versatile for both casual and dressier occasions.", category: "Sandals", best_Popular: ""),
    
    Shoe(id: "shoe-13",image: "sandal3", title: "Li-Ning Coca Sandals", sizes: ["UK6", "UK7", "UK8", "UK9"], price: 80, description: "Designed for men and women who value both style and comfort, these sandals are the perfect addition to your footwear collection. Made by Li-Ning, a renowned brand known for its quality and craftsmanship, these sandals are a must-have for any fashion-forward individual.", category: "Sandals", best_Popular: ""),

    Shoe(id: "shoe-14",image: "sandal4", title: "Li-Ning Offcourt Slides", sizes: ["UK6", "UK7", "UK8", "UK9"], price: 129, description: "The perfect footwear for men who value both style and comfort. Designed by Li Ning, a renowned brand in the world of sports, these slides are a must-have for any modern gentleman.", category: "Sandals", best_Popular: "best selling"),

    Shoe(id: "shoe-15",image: "sandal5", title: "Li-Ning Trendy Slides", sizes: ["UK6", "UK7", "UK8", "UK9"], price: 239, description: "The perfect footwear for men who value both style and comfort. Designed by Li Ning, a renowned brand in the world of sports, these slides are a must-have for any modern gentleman.", category: "Sandals", best_Popular: ""),
    
    //badminton shoes
    Shoe(id: "shoe-16",image: "badmintonShoe1", title: "Li-Ning Thunder Bolt", sizes: ["UK6", "UK7", "UK8", "UK9"], price: 300, description: "Introducing the LI-NING THUNDER BOLT TRAINING BADMINTON SHOES in white, perfect for women who are serious about their game. These shoes are designed to provide the ultimate support, stability, and comfort to help you reach your full potential on the court. With a sleek and stylish design, you'll look and feel confident when you step onto the court.", category: "Badminton Shoe", best_Popular: ""),
    
    Shoe(id:  "shoe-17",image: "badmintonShoe2", title: "Li-Ning All Around", sizes: ["UK6", "UK7", "UK8", "UK9"], price: 310, description: "Seamless badminton training shoes, the use of simple color matching, simple and casual. The upper is made of comfortable material, comfortable and soft, providing good foot feeling. Li Ning brand logo design, meticulous workmanship, highlight the brand charm. Anti-collision design of the toe, reduce the chafing toe or collision, care for every step.", category: "Badminton Shoe", best_Popular: "popular"),
    
    Shoe(id: "shoe-18",image: "badmintonShoe3", title: "Li-Ning Saga", sizes: ["UK6", "UK7", "UK8", "UK9"], price: 290, description: "Step up your badminton game with the LI-NING SAGA II LITE Badminton Shoes. Designed for the modern player, these shoes combine style and performance to elevate your on-court experience.", category: "Badminton Shoe", best_Popular: ""),
    
    Shoe(id: "shoe-19",image: "badmintonShoe4", title: "Li-Ning DF", sizes: ["UK6", "UK7", "UK8", "UK9"], price: 200, description: "Introducing the LI-NING MEN'S DF LITE BADMINTON SHOES, designed for the modern athlete. These stylish shoes in the classic white color offer both durability and performance. With their lightweight design, they provide the perfect balance of support and agility on the badminton court.", category: "Badminton Shoe", best_Popular: ""),
    
    Shoe(id: "shoe-20",image: "badmintonShoe5", title: "Li-Ning Halberd", sizes: ["UK6", "UK7", "UK8", "UK9"], price: 250, description: "Designed for the modern player, these shoes combine style and performance for the ultimate badminton experience. With their sleek black design, they exude confidence and power on the court.", category: "Badminton Shoe", best_Popular: "best selling"),
    
    //sneakers
    Shoe(id: "shoe-21",image: "sneaker1", title: "Nike Air Force 1", sizes: ["UK6", "UK7", "UK8", "UK9"], price: 439, description: "The radiance lives on in the Nike Air Force 1 '07, the basketball original that puts a fresh spin on what you know best: durably stitched overlays, clean finishes and the perfect amount of flash to make you shine.", category: "Sneakers", best_Popular: ""),
    
    Shoe(id: "shoe-22",image: "sneaker2", title: "Nike Dunk Low Retro", sizes: ["UK6", "UK7", "UK8", "UK9"], price: 389, description: "Created for the hardwood but taken to the streets, the Nike Dunk Low Retro returns with crisp overlays and original team colours. This basketball icon channels '80s vibes with premium leather in the upper that looks good and breaks in even better. Modern footwear technology helps bring the comfort into the 21st century.", category: "Sneakers", best_Popular: "best selling"),

    Shoe(id: "shoe-23",image: "sneaker3", title: "Nike Dunk Low Retro", sizes: ["UK6", "UK7", "UK8", "UK9"], price: 389, description: "Recognising the Dunk's roots as the top-ranking university-team sneaker, the Be True To Your School Pack looks to the original ad campaign for inspiration. Colours represent top-flight universities, while crisp leather has the perfect amount of sheen to make 'em a hands-down win. So lace up and show off that varsity spirit. Are you game?", category: "Sneakers", best_Popular: ""),

    Shoe(id: "shoe-24",image: "sneaker4", title: "Nike Air Max Solo", sizes: ["UK6", "UK7", "UK8", "UK9"], price: 239, description: "These sneakers are for the Air Max superfans. By combining elements from past Air Max models (like the AM90-inspired heel cup), we created a whole new look. The AM180 influences the textured Air unit, which delivers just the right amount of cushioning. Go ahead—Max out your look.", category: "Sneakers", best_Popular: "popular"),

    Shoe(id: "shoe-25",image: "sneaker5", title: "Nike SB Force 58", sizes: ["UK6", "UK7", "UK8", "UK9"], price: 379, description: "The latest and greatest innovation to hit the streets, the Force 58 gives you the durability of a cupsole with the flexibility of vulcanised shoes. Made from canvas and suede and finished with perforations on the toe, the whole look is infused with heritage basketball DNA.", category: "Sneakers", best_Popular: ""),
    
    //hiking shoe
    Shoe(id:  "shoe-26",image: "hikingShoe1", title: "Nike Legend Essential 3 Next Nature", sizes: ["UK6", "UK7", "UK8", "UK9"], price: 239, description: "Meet the trainer versatile enough to withstand the rigours of a fast-paced group class or a heavy day in the weight room. Equipped with a flat heel, high-abrasion materials and a flexible sole, it provides comfort and support that's ready to hike.", category: "Hiking Shoe", best_Popular: ""),
    
    Shoe(id: "shoe-27",image: "hikingShoe2", title: "Nike MC Trainer 2", sizes: ["UK6", "UK7", "UK8", "UK9"], price: 279, description: "The Nike MC Trainer 2 can help you shift from circuit training in the weight room to the Astroturf for quick-twitch conditioning, seamlessly. It's a multi-purpose power that combines versatility, stability and longevity so that you can stay locked in on the physical task at hand. From back squats to sprint repeats, it can help support the rigours of your diverse training programme without having to make a pit stop to grab more gear for your workout.", category: "Hiking Shoe", best_Popular: "popular"),
    
    Shoe(id: "shoe-28",image: "hikingShoe3", title: "Nike Free Metcon 5", sizes: ["UK6", "UK7", "UK8", "UK9"], price: 189, description: "When your workouts wade into the nitty-gritty, the Nike Free Metcon 5 can meet you in the depths, help you dig deep to find that final ounce of force and come out of the other side on a high. It matches style with substance, forefoot flexibility with back-end stability, perfect for flying through a cardio day or enhancing your agility. A revamped upper offers easier entry with a collar made just for your ankle.", category: "Hiking Shoe", best_Popular: ""),
    
    Shoe(id: "shoe-29",image: "hikingShoe4", title: "Nike Flex Experience", sizes: ["UK6", "UK7", "UK8", "UK9"], price: 145, description: "Stay steady and keep progressing towards your hiking goals in the Flex Experience 12. Minimal with full range of motion from heel to toe, it's made to move with every stride, pace and kick when you find your groove.", category: "Hiking Shoe", best_Popular: ""),

    Shoe(id: "shoe-30",image: "hikingShoe5", title: "Nike Defy All Day", sizes: ["UK6", "UK7", "UK8", "UK9"], price: 255, description: "Take on everyday challenges in the Nike Defy All Day.Leather up top and rubber traction on the bottom create a durable design that lasts the rigours of tough training sessions.Soft cushioning carries comfort through your workout—or throughout a day of getting things done.", category: "Hiking Shoe", best_Popular: "")
]
