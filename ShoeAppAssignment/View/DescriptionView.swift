//
//  DescriptionView.swift
//  ShoeShop
//
//  Created by Zhen Wai on 04/03/2024.
//

import SwiftUI


struct DescriptionView: View {
    
    @EnvironmentObject var cartViewModel:CartViewModel
    @EnvironmentObject var favouriteViewModel:favouriteViewModel
    
    @Environment(\.dismiss) var dismiss
    
    @State var showMessage:Bool = false
    @State var messageText:String = ""
    
    var shoe:Shoe
    
    @State private var quantity: Int = 1
    @State private var selectedSize: String = "UK6"
    
    var body: some View {
        NavigationStack{
            VStack {
                ScrollView{
                    VStack{
                        ZStack(alignment: .top){
                            Image(shoe.image)
                                .resizable()
                                .scaledToFill()
                            
                            HStack{
                                Button(action: {dismiss()}, label: {
                                    Image(systemName: "arrow.left")
                                        .foregroundStyle(.black)
                                })
                                
                                Spacer()
                                
                                Button(action: {
                                    if favouriteViewModel.isFavourite(shoe: shoe){
                                        favouriteViewModel.removeFromFavourite(shoe: shoe)
                                        messageText = "Removed from favourite"
                                    }else{
                                        favouriteViewModel.addToFavourite(shoe: shoe)
                                        messageText = "Added to favourite"
                                    }
                                    showMessage = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                                        showMessage = false
                                    }
                                },label:{
                                    Image(systemName: favouriteViewModel.isFavourite(shoe: shoe) ? "heart.fill" : "heart")
                                        .foregroundStyle(favouriteViewModel.isFavourite(shoe: shoe) ? .red : .black)
                                })
                            }
                            .imageScale(.large)
                            .padding(.horizontal,25)
                            .padding(.top, safeArea().top)
                        }
                        
                        VStack{
                            HStack{
                                Text(shoe.title)
                                    .font(.title.bold())
                                Spacer()
                            }
                            .padding(.bottom,20)
                            
                            HStack{
                                Text(String(format: "RM %.2f", shoe.price))
                                    .font(.title3)
                                
                                Spacer()
                            }
                        }
                        .padding()
                        
                        VStack(alignment: .leading){
                            HStack {
                                Text("Sizes")
                                    .font(.title.bold())
                                
                                Spacer()
                            }
                            
                            ScrollView(.horizontal){
                                HStack {
                                    ForEach(shoe.sizes, id: \.self){ size in
                                        Text(size)
                                            .font(.title2)
                                            .frame(width:100,height: 50)
                                            .foregroundStyle(selectedSize == size ? Color.white : .gray)
                                            .background(selectedSize == size ? Color("mainColour") : .gray.opacity(0.06))
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .padding(.horizontal,5)
                                            .onTapGesture{
                                                selectedSize = size
                                            }
                                        
                                    }
                                    
                                }
                                
                            }
                            .scrollIndicators(.hidden)
                        }
                        .padding()
                        
                        VStack{
                            HStack{
                                Text("Descriptions")
                                    .font(.title.bold())
                                Spacer()
                            }
                            .padding(.bottom,20)
                            
                            Text(shoe.description)
                                .foregroundStyle(.gray)
                                .font(.title3)
                                .lineSpacing(3)
                        }
                        .padding()
                        
                        HStack{
                            
                            Spacer()
                            
                            Button(action: {
                                if quantity > 1{
                                    quantity -= 1
                                }
                            }, label: {
                                Image(systemName: "minus")
                                    .font(.title2.bold())
                                    .foregroundStyle(.gray)
                            })
                            
                            Text("\(quantity)")
                                .foregroundStyle(Color.black)
                                .font(.title3)
                                .padding()
                                .overlay{
                                    RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth:1)
                                }
                            
                            Button(action:{
                                quantity += 1
                            }, label:{Image(systemName: "plus")
                                    .font(.title2.bold())
                                    .foregroundStyle(Color("mainColour"))
                            })
                            
                            Spacer()
                            
                            Button(action: {
                                cartViewModel.addToCart(shoe: shoe, quantity: quantity, selectedSize: selectedSize)
                                showMessage = true
                                messageText = "Added to cart"
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                                    showMessage = false
                                }
                            }, label: {
                                Text("Add To Cart")
                                    .font(.title2)
                                    .foregroundStyle(Color.white)
                                    .padding()
                                    .background(Color("mainColour"))
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            })
                            
                            Spacer()
                        }
                        .padding(.vertical)
                    }
                }
                .ignoresSafeArea()
                .scrollIndicators(.hidden)
            }
            .overlay(
                Group {
                    if showMessage {
                        Text(messageText)
                            .padding()
                            .background(Color.black.opacity(0.75))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .transition(.opacity)
                            .animation(.easeInOut, value: showMessage)
                            .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
                    }
                }
            )
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    DescriptionView(shoe: Shoes[0])
        .environmentObject(CartViewModel())
        .environmentObject(favouriteViewModel())
}

//need the size of padding from safe area as safe area size will differ in diffrent devices
extension View{
    func safeArea() -> UIEdgeInsets{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            return .zero
        }
        
        return safeArea
    }
}
