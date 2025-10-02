import from byllm { Model, Image }

glob llm = Model(model_name="gpt-4o");

# One tiny object replaces a giant schem
obj MemoryDetails {
    has who: list[str];
    has what: str;
    has where: str;
}
sem MemoryDetails = "Extract people, event, place from the photo";

def extract_memory_details(
    image: Image, city: str
) -> MemoryDetails by llm(); # Magic happens

with entry {
    img = Image("image.png");
    details = extract_memory_details(img, "Paris");
    print(details);
}
