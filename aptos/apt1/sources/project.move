module MyModule::TimeCapsule {

    use aptos_framework::timestamp;
    use aptos_framework::signer;
    use aptos_framework::event;

    struct TimeCapsule has store, key {
        owner: address,
        message: vector<u8>,
        unlock_time: u64,
    }

    /// Function to create a time capsule with a message and unlock time.
    public fun create_capsule(capsule_owner: &signer, message: vector<u8>, unlock_time: u64) {
        let capsule = TimeCapsule {
            owner: signer::address_of(capsule_owner),
            message,
            unlock_time,
        };
        move_to(capsule_owner, capsule);
    }

}
