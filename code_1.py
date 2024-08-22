def reverse_number(num):
    # Reverse the number
    reverse = int(str(num)[::-1])
    # Return the number
    return reverse

def main():
    # Reverse the number 123
    a = reverse_number(123)
    # Print the result, which should be 321
    print(a)

if __name__ == "__main__":
    main()
