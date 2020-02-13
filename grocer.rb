def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  # Consult README for inputs and outputs
  i = 0
  while i < collection.count
    if collection[i][:item] == name
      return collection[i]
    end
    i += 1
  end
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  new_array = []
  i = 0
  while i < cart.count
  new_cart_item = find_item_by_name_in_collection(cart[i][:item], new_array)
  if new_cart_item != nil
    new_cart_item[:count] += 1
  else
    new_cart_item =
    {
      :item=>cart[i][:item],
      :price=>cart[i][:price],
      :clearance=>cart[i][:clearance],
      :count=>1
    }
    new_array << new_cart_item
  end
i += 1
  end
  new_array
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  # REMEMBER: This method **should** update cart
  i = 0
  while i < coupons.count
cart_item = find_item_by_name_in_collection(coupons[i][:item], cart)
coupon_item_name = "#{coupons[i][:item]} W/COUPON"
cart_item_with_coupon = find_item_by_name_in_collection(coupon_item_name, cart)
if cart_item && cart_item[:count] >= coupons[i][:num]
  if cart_item_with_coupon
    cart_item_with_coupon[:count] += coupons[i][:num]
    cart_item[:count] -= coupons[i][:num]
  else
    cart_item_with_coupon = {
      :item=>coupon_item_name,
      :price=>coupons[i][:cost] / coupons[i][:num],
      :count=>coupons[i][:num],
      :clearance=>cart_item[:clearance]
    }
    cart << cart_item_with_coupon
    cart_item[:count] -= coupons[i][:num]
  end
  end
i += 1
  end
cart
  end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  # REMEMBER: This method **should** update cart
  i = 0
  while i < cart.count
    if cart[i][:clearance]
cart[i][:price] = (cart[i][:price] - (cart[i][:price] * 0.20)).round(2)
    end
    i += 1
end
cart
end
def checkout(cart, coupons)
  # Consult README for inputs and outputs

consolidated_cart = consolidate_cart(cart)
couponed_cart = apply_coupons(consolidated_cart, coupons)
clearanced_cart = apply_clearance(couponed_cart)
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  final_cart = apply_clearance(couponed_cart)
  total = 0
  i = 0
  while i < final_cart.count
    total += final_cart[i][:price] * final_cart[i][:count]
    i += 1
  end
  if total > 100
    total -= (total - 0.10)
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
total
end
